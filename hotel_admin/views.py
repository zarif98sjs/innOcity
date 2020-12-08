from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.db import connection
from .models import Room, Reservation, Service
from hotel.models import Hotel
from django.urls import reverse
import numpy as np
import matplotlib.pyplot as plt
import mpld3
import plotly.offline as opy
import plotly.graph_objs as go
from django.views.generic import TemplateView


import json


app_name = 'hotel_admin'
hotel = Hotel(0)
room_list = []


def index(request):

    if request.session.has_key('admin_id'):
        hotel_id = request.session['admin_id']

    else:
        messages.success(request, "You must log in first")
        return redirect('login:index')

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
                room_id = cur.var(int).var

                cur.callproc('ADD_NEW_ROOM', [hotel.hotelId, room_type, floor_number, room_id])
                room_id = room_id.getvalue()

                if room_id != 0:
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

                exists = cur.var(int).var
                cur.callproc("ADD_NEW_ROOM_TYPE", [room_type, hotel.hotelId, bed_type,
                                                   cost, discount, exists])

                if exists.getvalue() == 0:
                    messages.success(request, "New room type added")
                else:
                    messages.success(request, "Room type already exists")

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
                cur.callproc('ADD_NEW_FREE_SERVICE', [hotel.hotelId, new_facility])

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
                exists = cur.var(int).var
                cur.callproc("ADD_NEW_PAID_SERVICE", [service_type, service_subtype, cost, hotel.hotelId, exists])

                if exists.getvalue() == 0:
                    messages.success(request, "New paid service added")
                else:
                    messages.success(request, "Service already exists")

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


class Graph(TemplateView):

    def set_reservations(self, reservation_list):

        self.reservation_list = reservation_list
        self.reservation_dates = [res.date_of_arrival for res in reservation_list]
        self.reservation_costs = [res.total for res in reservation_list]

    def get_context_data(self, **kwargs):

        xy = {'x': self.reservation_dates, 'y': self.reservation_costs}
        data = go.Bar(xy, x=xy['x'], y=xy['y'])
        layout = go.Layout(xaxis={'title': 'date', 'type': 'date'},
                           yaxis={'title':'cost'})
        figure = go.Figure(data=data, layout=layout)
        div = opy.plot(figure, auto_open=False, output_type='div')
        return div


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

        sql = "SELECT RS.RESERVATIONID, RS.DATE_OF_ARRIVAL, RS.DATE_OF_DEPARTURE, RS.RESERVATION_CHARGE, C.NAME, " \
              "(SELECT NVL(SUM(RSS.QUANTITY * S.COST),0) FROM RESERVATION_SERVICE RSS, SERVICE S " \
              "WHERE RSS.RESERVATIONID = RS.RESERVATIONID AND RSS.SERVICEID = S.SERVICEID) AS SERVICE_CHARGE " \
              "FROM RESERVATION RS, CUSTOMER C WHERE RS.HOTELID = %s AND " \
              "RS.CUSTOMERID = C.CUSTOMERID "
        list_vars = [hotel.hotelId]
        selected_room = None

        if request.method == "POST" and request.POST.get("search"):

            if request.POST.get("month"):
                sql += "AND EXTRACT(MONTH FROM RS.DATE_OF_ARRIVAL) = %s "
                list_vars.append(request.POST.get("month"))

            if request.POST.get("year"):
                sql += "AND EXTRACT(YEAR FROM RS.DATE_OF_ARRIVAL) = %s "
                list_vars.append(request.POST.get("year"))

            if request.POST.get("room_bed") and request.POST.get("room_bed") != "all rooms":
                selected_room, _ = request.POST.get("room_bed").split('(')
                selected_room = selected_room.strip()

        if request.method == "POST" and request.POST.get("file-upload"):
            print('here')
            print(request.POST.get("filename"))

        sql += "ORDER BY RS.DATE_OF_ARRIVAL DESC"

        cur.execute(sql, list_vars)
        result = cur.fetchall()

        total = 0
        total_reservation_charge = 0
        total_service_charge = 0
        reservation_list = []
        for row in result:

            reserve = Reservation(
                date_of_arrival=row[1], date_of_departure=row[2], reservation_charge=row[3],
                name=row[4], service_charge=row[5])
            sql = "SELECT RT.ROOMTYPE_NAME, RT.BED_TYPE FROM ROOM_TYPE RT, ROOM RM, RESERVATION_ROOM RR " \
                  "WHERE RR.RESERVATIONID = %s AND RM.ROOMID = RR.ROOMID AND RM.ROOMTYPEID = RT.ROOMTYPEID "
            list_vars = [row[0]]

            if selected_room is not None:
                sql += " AND RT.ROOMTYPE_NAME = %s"
                list_vars.append(selected_room)

            cur.execute(sql, list_vars)
            res = cur.fetchall()
            if not res:
                continue

            reserve.room_types = [r[0] + " (" + r[1] + ") " for r in res]
            total_reservation_charge += reserve.reservation_charge
            total_service_charge += reserve.service_charge
            total += reserve.total
            reservation_list.append(reserve)

        context = {'hotel': hotel, 'room_list': room_list, 'reservation_list': reservation_list, 'total': total,
                   'total_reservation_charge': total_reservation_charge, 'total_service_charge': total_service_charge}
        g = Graph()
        g.set_reservations(reservation_list)
        con = g.get_context_data()

        context['graph'] = con

        return render(request, 'hotel_admin/reservation.html', context=context)

