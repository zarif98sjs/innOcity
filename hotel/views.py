from django.shortcuts import render
from django.http import Http404
from .models import Hotel, Room , Session
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
from django.db import connection
from random import seed
from random import randint
import login.views

# Create your views here.

app_name = 'hotel'

session_id = 0
sessions = {}
@csrf_exempt
def available(request):

    destination = request.POST.get('destination').upper()
    checkin_input = request.POST.get('checkin')
    checkin_date_ymd = datetime.strptime(checkin_input, "%Y-%m-%d").date()
    checkin_date = checkin_date_ymd.strftime('%d %b,%Y')

    checkout_input = request.POST.get('checkout')
    checkout_date_ymd = datetime.strptime(checkout_input, "%Y-%m-%d").date()
    checkout_date = checkout_date_ymd.strftime('%d %b,%Y')

    seed(1)
    global session_id
    global sessions

    session_id = randint(10, 10000)
    sessions[session_id] = Session(session_id, checkin_date, checkout_date)
    logged_in = (login.views.customer_id != 0)

    available_hotels = []

    with connection.cursor() as cur:

        sql = "SELECT * FROM HOTEL WHERE UPPER(CITY) = %s OR UPPER(COUNTRY)= %s"
        cur.execute(sql, [destination, destination])
        result = cur.fetchall()

        for row in result:

            hotelId = row[0]
            sql2 = "SELECT COUNT(*) FROM ROOM WHERE HOTELID= %s"
            cur.execute(sql2, [hotelId])
            total_count = cur.fetchone()[0]

            sql3 = "SELECT COUNT(*) FROM RESERVATION WHERE HOTELID= %s AND (DATE_OF_ARRIVAL <= %s " \
                   "AND DATE_OF_DEPARTURE >= %s)"

            cur.execute(sql3, [hotelId, checkout_date, checkin_date])
            total_count -= cur.fetchone()[0]

            if total_count > 0:
                hotel = Hotel(hotelId=row[0], name=row[1], street=row[2], zipcode=row[3], city=row[4],
                              country=row[5], rating=row[6], rating_count=row[7])
                hotel.set_rooms(total_count)
                hotel.add_facilities(get_facilities(hotelId))
                available_hotels.append(hotel)

        return render(request, 'hotel/available.html', {'available_hotels': available_hotels,
                                                        'destination': destination, 'logged_in': logged_in})


def index(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/index.html', context)

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
        hotel_facilities = []
        for row in result:
            hotel_facilities.append(row[0])
        return hotel_facilities


def get_services(hotel_id):

    with connection.cursor() as cur:
        sql = "SELECT SERVICE_TYPE FROM SERVICE WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()
        hotel_services = set()
        for row in result:
            hotel_services.add(row[0])
        return hotel_services


def get_rooms(hotel_id):

    global session_id
    global sessions

    room_ids_cancel = []
    with connection.cursor() as cur:
        if session_id != 0:

            checkin_date = sessions[session_id].checkin_date
            checkout_date = sessions[session_id].checkout_date

            sql0 = "SELECT ROOMID FROM RESERVATION WHERE HOTELID= %s AND (DATE_OF_ARRIVAL <= %s " \
                   "AND DATE_OF_DEPARTURE >= %s)"

            cur.execute(sql0, [hotel_id, checkout_date, checkin_date])
            result0 = cur.fetchall()

            for row in result0:
                room_ids_cancel.append(row[0])

        sql1 = "SELECT ROOMID FROM ROOM WHERE hotelId= %s"

        cur.execute(sql1, [hotel_id])
        result1 = cur.fetchall()

        room_ids_ok = []
        for row in result1:
            if row[0] not in room_ids_cancel:
                room_ids_ok.append(row[0])

        type_map = []
        room_type_set = []

        for r_id in room_ids_ok:

            sql = "SELECT roomId, room_type, bed_type, cost_per_day, discount, special_offer FROM ROOM WHERE hotelId= %s " \
                  "AND ROOMID = %s"
            cur.execute(sql, [hotel_id, r_id])
            row = cur.fetchone()
            room = Room(row[0], row[1], row[2], row[3], row[4], row[5])
            if room.room_type not in type_map:
                room.add_facilities(get_room_facilities(room.roomId))
                room_type_set.append(room)
                type_map.append(room.room_type)
        return room_type_set


def get_room_facilities(room_id):

    with connection.cursor() as cur:
        sql = "SELECT facilities FROM ROOM_FACILITY WHERE roomId= %s"
        cur.execute(sql, [room_id])
        result = cur.fetchall()
        room_facilities = []
        for row in result:
            room_facilities.append(row[0])
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



