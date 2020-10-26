from django.shortcuts import render
from django.http import Http404
from .models import Hotel, Room , Session
from django.views.decorators.csrf import csrf_exempt
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
    room_no = request.POST.get('rooms')
    checkin_input = request.POST.get('checkin')
    checkout_input = request.POST.get('checkout')

    seed(1)
    global session_id
    global sessions

    session_id = randint(10, 10000)
    sessions[session_id] = Session(session_id, checkin_input, checkout_input)
    logged_in = (login.views.customer_id != 0)

    available_hotels = []

    with connection.cursor() as cur:

        sql = "SELECT H.*," \
              "(SELECT COUNT(R.ROOMID) FROM ROOM R WHERE R.HOTELID = H.HOTELID)," \
              "(SELECT COUNT(DISTINCT ROOMID) FROM RESERVATION RS WHERE RS.HOTELID = H.HOTELID AND " \
              "(RS.DATE_OF_ARRIVAL <= TO_DATE(%s, 'YYYY-MM-DD') AND RS.DATE_OF_DEPARTURE >= TO_DATE(%s, 'YYYY-MM-DD'))) " \
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
        sql = "SELECT SERVICE_TYPE FROM SERVICE WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()
        hotel_services = set([row[0] for row in result])
        return hotel_services


def get_rooms(hotel_id):

    global session_id
    global sessions

    with connection.cursor() as cur:
        if session_id != 0:

            checkin_date = sessions[session_id].checkin_date
            checkout_date = sessions[session_id].checkout_date

            sql = "SELECT * FROM ROOM WHERE HOTELID = %s AND " \
                  "ROOMID NOT IN (SELECT RS.ROOMID FROM RESERVATION RS WHERE HOTELID = %s " \
                  "AND DATE_OF_ARRIVAL <= TO_DATE(%s, 'YYYY-MM-DD') AND DATE_OF_DEPARTURE >= TO_DATE(%s, 'YYYY-MM-DD'))"
            cur.execute(sql, [hotel_id, hotel_id, checkout_date, checkin_date])

        else:
            sql = "SELECT * FROM ROOM WHERE HOTELID = %s"
            cur.execute(sql, [hotel_id])

        result = cur.fetchall()
        available_rooms = []
        room_types = []
        for row in result:

            if row[1] not in room_types:
                room_types.append(row[1])
                room = Room(roomId=row[0], room_type=row[1], bed_type=row[2], cost=row[4], discount=row[5], special_offer=row[6])
                room.add_facilities(get_room_facilities(row[0]))
                available_rooms.append(room)

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



