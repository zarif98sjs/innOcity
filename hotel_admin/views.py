from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.db import connection
from .models import Room, Reservation, Service
from hotel.models import Hotel
from django.urls import reverse

import random

app_name = 'hotel_admin'
hotel = Hotel(0)
room_list = []


def index(request):

    if not request.session.has_key('admin_id'):
        return redirect('login:index')
    else:
        hotel_id = request.session['admin_id']

    global hotel
    get_hotel(hotel_id)

    with connection.cursor() as cur:

        if request.method == 'POST':

            if request.POST.get("submit_cost"):

                room_type = request.POST.get("room_type")
                bed_type = request.POST.get("bed_type")
                cost_per_day = request.POST.get("cost_per_day")
                discount = request.POST.get("discount")

                sql = "UPDATE ROOM_TYPE SET COST_PER_DAY = %s, DISCOUNT = %s " \
                      "WHERE HOTELID = %s AND ROOMTYPE_NAME = %s AND BED_TYPE = %s"
                cur.execute(sql, [cost_per_day, discount, hotel.hotelId, room_type, bed_type])
                connection.commit()
                messages.success(request, "Room Cost Updated")

            elif request.POST.get("submit_new_room"):

                room_type, _ = request.POST.get("room_bed").split(" (")
                floor_number = request.POST.get("floor_number")
                room_id = generate_new_id("SELECT ROOMID FROM ROOM")

                sql = "SELECT ROOMTYPEID FROM ROOM_TYPE WHERE HOTELID = %s AND ROOMTYPE_NAME = %s"
                cur.execute(sql, [hotel.hotelId, room_type])
                roomtype_id = cur.fetchone()[0]

                sql = "INSERT INTO ROOM(ROOMID, FLOOR_NUMBER, HOTELID, ROOMTYPEID) " \
                      "VALUES(%s, %s, %s, %s)"
                cur.execute(sql, [room_id, floor_number, hotel.hotelId, roomtype_id])
                connection.commit()

                i = 1
                while True:
                    f = request.POST.get("room_facilities-" + str(i))
                    if f is None:
                        break
                    if f is not "":
                        sql = "INSERT INTO ROOM_FACILITY VALUES(%s, INITCAP(%s))"
                        cur.execute(sql, [room_id, f])
                        connection.commit()
                    i = i + 1

                messages.success(request, "New Room Enlisted")

            elif request.POST.get("submit_new_room_type"):

                room_type = request.POST.get('room_type')
                bed_type = request.POST.get('bed_type')
                cost = request.POST.get('cost_per_day')
                discount = request.POST.get('discount')

                sql = "SELECT * FROM ROOM_TYPE WHERE HOTELID = %s AND UPPER(ROOMTYPE_NAME) = UPPER(%s) "
                cur.execute(sql, [hotel.hotelId, room_type])
                row = cur.fetchone()

                if row is None:
                    roomtype_id = generate_new_id("SELECT ROOMTYPEID FROM ROOM_TYPE")
                    sql = "INSERT INTO ROOM_TYPE VALUES(%s, INITCAP(%s), INITCAP(%s), %s, %s, %s)"
                    cur.execute(sql, [roomtype_id, room_type, bed_type, cost, discount, hotel.hotelId])
                    messages.success(request, "New Room Type Enlisted")
                else:
                    messages.success(request, "This Type Already Exists")

            return HttpResponseRedirect(reverse('hotel_admin:index'))

        global room_list
        get_room_list(hotel_id)

        return render(request, 'hotel_admin/index.html', {'hotel': hotel, 'room_list': room_list})


def get_room_list(hotel_id):

    global room_list
    with connection.cursor() as cur:
        sql = "SELECT RT.ROOMTYPE_NAME, RT.BED_TYPE, RT.COST_PER_DAY, RT.DISCOUNT, " \
              "(SELECT COUNT(*) FROM ROOM R WHERE R.ROOMTYPEID = RT.ROOMTYPEID) " \
              "FROM ROOM_TYPE RT " \
              "WHERE RT.HOTELID = %s"

        cur.execute(sql, [hotel_id])
        rooms = cur.fetchall()
        room_list = [Room(room_type=row[0], bed_type=row[1], cost_per_day=row[2], discount=row[3],
                          count=row[4]) for row in rooms]
        return room_list


def get_hotel(hotel_id):

    with connection.cursor() as cur:

        sql = "SELECT * FROM HOTEL WHERE HOTELID = %s"
        cur.execute(sql, [hotel_id])
        row = cur.fetchone()

        if row is None:
            return redirect('login:index')
        global hotel
        hotel = Hotel(hotelId=row[0], name=row[1], street=row[2], zipcode=row[3],
                      city=row[4], country=row[5], rating=row[6], rating_count=row[7])


def generate_new_id(sql):

    with connection.cursor() as cur:

        cur.execute(sql)
        result = cur.fetchall()
        current_ids = [row[0] for row in result]

        while True:
            new_id = random.randint(10000000, 99999999)
            if new_id not in current_ids:
                return new_id


def service(request):

    global hotel

    if not request.session.has_key('admin_id'):
        return redirect('login:index')

    if hotel.hotelId == 0:

        hotel_id = request.session['admin_id']
        get_hotel(hotel_id)

    with connection.cursor() as cur:

        if request.method == "POST":

            if request.POST.get("submit_new_facility"):

                new_facility = request.POST.get("facility")
                sql = "INSERT INTO HOTEL_FACILITY VALUES(%s, INITCAP(%s))"
                cur.execute(sql, [hotel.hotelId, new_facility])
                connection.commit()
                messages.success(request, "New free service added")

            elif request.POST.get("submit_delete_facility"):

                delete_facility = request.POST.get("delete_list")
                sql = "DELETE HOTEL_FACILITY WHERE HOTELID = %s AND LOWER(FACILITIES) = LOWER(%s)"
                cur.execute(sql, [hotel.hotelId, delete_facility])
                messages.success(request, "Free service deleted")

            elif request.POST.get("submit_cost"):

                service_id = request.POST.get("service_id")
                cost = request.POST.get("cost")
                sql = "UPDATE SERVICE SET COST = %s WHERE SERVICEID = %s"
                cur.execute(sql, [cost, service_id])
                connection.commit()
                messages.success(request, "Service charge updated")

            elif request.POST.get("submit_new_service_under_service_type"):

                service_type = request.POST.get("service_type")
                service_subtype = request.POST.get("service_subtype")
                cost = request.POST.get("cost")
                service_id = generate_new_id("SELECT SERVICEID FROM SERVICE")
                sql = "INSERT INTO SERVICE VALUES(%s, %s, INITCAP(%s), %s, %s)"
                cur.execute(sql, [service_id, service_type, service_subtype, cost, hotel.hotelId])
                connection.commit()
                messages.success(request, "New paid service added")

            return HttpResponseRedirect(reverse('hotel_admin:service'))

        sql = "SELECT DISTINCT FACILITIES FROM HOTEL_FACILITY WHERE HOTELID = %s"
        cur.execute(sql, [hotel.hotelId])
        result = cur.fetchall()
        hotel_facilities = [row[0] for row in result]

        sql = "SELECT SERVICEID, SERVICE_TYPE, SERVICE_SUBTYPE, COST FROM SERVICE WHERE HOTELID = %s"
        cur.execute(sql, [hotel.hotelId])
        result = cur.fetchall()
        services_list = {}
        for row in result:
            serv = Service(serviceId=row[0], service_type=row[1], service_subtype=row[2], cost=row[3])
            service_type = row[1]
            if service_type in services_list:
                services_list[service_type].append(serv)
            else:
                services_list[service_type] = [serv]

        return render(request, 'hotel_admin/service.html', {'hotel': hotel, 'hotel_facilities': hotel_facilities,
                                                            'service_list': services_list})


def reservation(request):

    global hotel
    global room_list

    if not request.session.has_key('admin_id'):
        return redirect('login:index')

    if hotel.hotelId == 0:
        hotel_id = request.session['admin_id']
        get_hotel(hotel_id)
        get_room_list(hotel_id)

    with connection.cursor() as cur:

        sql = "SELECT RS.DATE_OF_ARRIVAL, RS.DATE_OF_DEPARTURE, RS.RESERVATION_CHARGE, C.NAME, R.ROOMID, " \
              "R.FLOOR_NUMBER, RT.ROOMTYPE_NAME, RT.BED_TYPE, " \
              "(SELECT NVL(SUM(RSS.QUANTITY * S.COST),0) FROM RESERVATION_SERVICE RSS, SERVICE S " \
              "WHERE RSS.RESERVATIONID = RS.RESERVATIONID AND RSS.SERVICEID = S.SERVICEID) AS SERVICE_CHARGE " \
              "FROM RESERVATION RS, CUSTOMER C, ROOM R, ROOM_TYPE RT WHERE RS.HOTELID = %s AND " \
              "RS.CUSTOMERID = C.CUSTOMERID AND RS.ROOMID = R.ROOMID AND R.ROOMTYPEID = RT.ROOMTYPEID "
        list_vars = [hotel.hotelId]

        if request.method == "POST" and request.POST.get("search"):

            if request.POST.get("month"):
                sql += "AND EXTRACT(MONTH FROM RS.DATE_OF_ARRIVAL) = %s "
                list_vars.append(request.POST.get("month"))

            if request.POST.get("year"):
                sql += "AND EXTRACT(YEAR FROM RS.DATE_OF_ARRIVAL) = %s "
                list_vars.append(request.POST.get("year"))

            if request.POST.get("room_bed") != "all rooms":
                room_type, bed_type = request.POST.get("room_bed").split(" (")
                sql += "AND RT.ROOMTYPE_NAME = %s "
                list_vars.append(room_type)

        sql += "ORDER BY R.ROOMID ASC, RS.DATE_OF_ARRIVAL DESC"

        cur.execute(sql, list_vars)
        result = cur.fetchall()

        total = 0
        reservation_list = []
        for row in result:

            reserve = Reservation(
                date_of_arrival=row[0], date_of_departure=row[1], reservation_charge=row[2],
                name=row[3], roomId=row[4], floor_num=row[5], room_type=row[6], bed_type=row[7],
                service_charge=row[8]
            )
            total += reserve.total
            reservation_list.append(reserve)

        return render(request, 'hotel_admin/reservation.html', {'hotel': hotel, 'room_list': room_list,
                                                                'reservation_list': reservation_list, 'total': total})

