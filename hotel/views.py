from datetime import datetime
from django.shortcuts import render, redirect
from django.http import Http404
from .models import Hotel, Room, Service, Session
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from django.db import connection
from random import seed
from random import randint
from dashboard.models import Customer

app_name = 'hotel'

session_id = 0
sessions = {}

customer = Customer(0)


@csrf_exempt
def available(request):

    destination = request.POST.get('destination').upper()
    room_no = request.POST.get('rooms')
    checkin_input = request.POST.get('checkin')
    checkout_input = request.POST.get('checkout')

    seed(1)
    global session_id
    global sessions

    session_id = randint(10, 10000)
    sessions[session_id] = Session(session_id, checkin_input, checkout_input)

    logged_in = request.session.has_key('customer_id')

    available_hotels = []

    with connection.cursor() as cur:

        sql = "SELECT H.HOTELID, H.NAME, H.STREET, H.ZIPCODE, H.CITY, H.COUNTRY, H.RATING, H.RATINGCOUNT, " \
              "(SELECT COUNT(R.ROOMID) FROM ROOM R WHERE R.HOTELID = H.HOTELID)," \
              "(SELECT COUNT(DISTINCT ROOMID) FROM RESERVATION RS WHERE RS.HOTELID = H.HOTELID AND " \
              "(RS.DATE_OF_ARRIVAL <= TO_DATE(%s, 'YYYY-MM-DD') " \
              "AND RS.DATE_OF_DEPARTURE >= TO_DATE(%s, 'YYYY-MM-DD'))) " \
              "FROM HOTEL H " \
              "WHERE UPPER(CITY) = %s OR UPPER(COUNTRY) = %s"
        cur.execute(sql, [checkout_input, checkin_input, destination, destination])
        result = cur.fetchall()

        for row in result:

            total_count = row[8] - row[9]

            if total_count >= int(room_no):
                hotel = Hotel(hotelId=row[0], name=row[1], street=row[2], zipcode=row[3], city=row[4],
                              country=row[5], rating=row[6], rating_count=row[7])
                hotel.set_rooms(total_count)
                hotel.add_facilities(get_facilities(row[0]))
                available_hotels.append(hotel)

        return render(request, 'hotel/available.html', {'available_hotels': available_hotels,
                                                        'destination': destination, 'logged_in': logged_in})


def index(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/index.html', context)


@csrf_exempt
def payment(request, hotel_id):
    if request.session.has_key('customer_id'):
        logged_in = True
        customer_id = request.session['customer_id']
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    with connection.cursor() as cur:
        cur.execute("SELECT * FROM CUSTOMER WHERE customerId = %s", [customer_id])
        result = cur.fetchone()

        if result is None:
            return redirect('login:index')
        else:
            global customer
            customer = Customer(customer_id=customer_id, name=result[1], email=result[2], username=result[3],
                                gender=result[5], street=result[6], zipcode=result[7], city=result[8], country=result[9])

    context = get_context(hotel_id)
    checkin_input = request.POST.get('checkin')
    checkin_date_ymd = datetime.strptime(checkin_input, "%Y-%m-%d").date()
    checkin_date = checkin_date_ymd.strftime('%d %b,%Y')
    print(checkin_date)

    checkout_input = request.POST.get('checkout')
    checkout_date_ymd = datetime.strptime(checkout_input, "%Y-%m-%d").date()
    checkout_date = checkout_date_ymd.strftime('%d %b,%Y')
    print(checkout_date)

    delta = checkout_date_ymd - checkin_date_ymd
    stay = delta.days
    print(delta.days)

    room_cnt = {}

    room_cnt[0] = request.POST.get('Studio')
    room_cnt[1] = request.POST.get('Regular')
    room_cnt[2] = request.POST.get('Presidential Suite')
    room_cnt[3] = request.POST.get('Suite')
    room_cnt[4] = request.POST.get('Villa')

    for i in range(5):
        if room_cnt[i] == None:
            room_cnt[i] = 0
        else:
            room_cnt[i] = int(room_cnt[i])

    print(room_cnt)

    with connection.cursor() as cur:
        sql = "SELECT ROOMTYPE_NAME , COST_PER_DAY , DISCOUNT FROM ROOM_TYPE WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()

        if result is None:
            raise Http404("Invalid hotel")
        else:
            for r in result:
                context[r[0]] = r[1] * (1 - r[2]/100)

        total_cost = 0
        total_cost += room_cnt[0]*context.get('Studio', 0)
        total_cost += room_cnt[1]*context.get('Regular', 0)
        total_cost += room_cnt[2]*context.get('Presidential Suite', 0)
        total_cost += room_cnt[3]*context.get('Suite', 0)
        total_cost += room_cnt[4]*context.get('Villa', 0)
        total_cost = total_cost*stay

        context['total_cost'] = total_cost

        print(context['total_cost'])
        context['logged_in'] = logged_in

        context['customer'] = customer

    return render(request, 'hotel/payment.html', context)


@csrf_exempt
def complete_payment(request, hotel_id):
    return redirect('dashboard:index')


def book(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/book.html', context)


def get_context(hotel_id):

    with connection.cursor() as cur:
        sql = "SELECT * FROM HOTEL WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchone()

        if result is None:
            raise Http404("Invalid hotel")
        else:
            hotel = Hotel(hotelId=result[0], name=result[1], street=result[2], zipcode=result[3],
                          city=result[4], country=result[5], rating=result[6], rating_count=result[7])
            hotel_facilities = get_facilities(hotel_id)
            hotel_services = get_services(hotel_id)
            room_types = get_rooms(hotel_id)
            context = {'hotel': hotel, 'hotel_facilities': hotel_facilities, 'hotel_services': hotel_services}

            if len(room_types):
                context['room_types'] = room_types

        return context


def get_facilities(hotel_id):

    with connection.cursor() as cur:
        sql = "SELECT facilities FROM HOTEL_FACILITY WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()
        hotel_facilities = [row[0] for row in result]
        return hotel_facilities


def get_services(hotel_id):

    with connection.cursor() as cur:
        sql = "SELECT * FROM SERVICE WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()
        hotel_services = {}
        for row in result:
            serve = Service(serviceId=row[0], service_type=row[1], service_subtype=row[2], cost=row[3])
            if serve.service_type in hotel_services:
                hotel_services[serve.service_type].append(serve)
            else:
                hotel_services[serve.service_type] = [serve]
        return hotel_services


def get_rooms(hotel_id):

    global session_id
    global sessions

    with connection.cursor() as cur:
        if session_id != 0:

            checkin_date = sessions[session_id].checkin_date
            checkout_date = sessions[session_id].checkout_date

            sql = "SELECT R.ROOMID, RT.ROOMTYPE_NAME, RT.BED_TYPE, RT.COST_PER_DAY, RT.DISCOUNT " \
                  "FROM ROOM R, ROOM_TYPE RT WHERE R.HOTELID = %s AND R.ROOMTYPEID = RT.ROOMTYPEID AND " \
                  "R.ROOMID NOT IN (SELECT RS.ROOMID FROM RESERVATION RS WHERE RS.HOTELID = %s " \
                  "AND RS.DATE_OF_ARRIVAL <= TO_DATE(%s, 'YYYY-MM-DD') AND " \
                  "RS.DATE_OF_DEPARTURE >= TO_DATE(%s, 'YYYY-MM-DD'))"
            cur.execute(sql, [hotel_id, hotel_id, checkout_date, checkin_date])

        else:
            sql = "SELECT R.ROOMID, RT.ROOMTYPE_NAME, RT.BED_TYPE, RT.COST_PER_DAY, RT.DISCOUNT " \
                  "FROM ROOM R, ROOM_TYPE RT WHERE R.HOTELID = %s AND R.ROOMTYPEID = RT.ROOMTYPEID"
            cur.execute(sql, [hotel_id])

        result = cur.fetchall()
        available_rooms = []
        room_types = {}

        for row in result:

            if row[1] not in room_types:
                room_types[row[1]] = len(available_rooms)
                room = Room(room_type=row[1], bed_type=row[2], cost=row[3], discount=row[4])
                room.roomId.append(row[0])
                room.add_facilities(get_room_facilities(row[0]))
                available_rooms.append(room)
            else:
                num = room_types[row[1]]
                available_rooms[num].roomId.append(row[0])
                available_rooms[num].count += 1
        return available_rooms


def get_room_facilities(room_id):

    with connection.cursor() as cur:
        sql = "SELECT facilities FROM ROOM_FACILITY WHERE roomId= %s"
        cur.execute(sql, [room_id])
        result = cur.fetchall()
        room_facilities = [row[0] for row in result]
        return room_facilities


def rooms(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/rooms.html', context)


def services(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/services.html', context)


def about(request, hotel_id):
    return render(request, 'hotel/about.html')


def blog(request, hotel_id):
    return render(request, 'hotel/blog.html')


def blog_single(request, hotel_id):
    return render(request, 'hotel/blog-single.html')


def contact(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/contact.html', context)



