from django.shortcuts import render
from django.http import Http404
from .models import Hotel, Room
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
import cx_Oracle
# Create your views here.

app_name = 'hotel'

@csrf_exempt
def available(request):

    destination = request.POST.get('destination').upper()
    checkin = request.POST.get('checkin')
    print(checkin)
    checkin_date = datetime.strptime(checkin, "%Y-%m-%d").date()
    print(checkin_date)
    checkin_date = checkin_date.strftime('%d %b,%Y')
    print(checkin_date)
    checkout = request.POST.get('checkout')
    checkout_date = datetime.strptime(checkout, "%Y-%m-%d").date()
    checkout_date = checkout_date.strftime('%d %b,%Y')

    available_hotels = []

    dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
    conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
    cur = conn.cursor()
    cur2 = conn.cursor()
    cur3 = conn.cursor()
    sql = "SELECT * FROM HOTEL WHERE UPPER(CITY)='"+destination+"' OR UPPER(COUNTRY)='"+destination+"'"
    cur.execute(sql)
    result = cur.fetchall()

    for row in result:

        hotelId = row[0]
        sql2 = "SELECT COUNT(*) FROM ROOM WHERE HOTELID="+str(hotelId)
        cur2.execute(sql2)
        total_count = cur2.fetchone()[0]

        sql3 = "SELECT COUNT(*) FROM RESERVATION WHERE HOTELID="+str(hotelId)+"AND (DATE_OF_ARRIVAL<='"+str(checkout_date)\
               +"' OR DATE_OF_DEPARTURE>='"+str(checkin_date)+"')"

        cur3.execute(sql3)

        total_count -= cur3.fetchone()[0]
        if total_count> 0:
            hotel = Hotel(hotelId=row[0], name=row[1], street=row[2], zipcode=row[3], city=row[4],
                          country=row[5], rating=row[6], rating_count=row[7])
            hotel.set_rooms(total_count)
            hotel.add_facilities(get_facilities(hotelId, conn))
            available_hotels.append(hotel)
    return render(request, 'hotel/available.html', {'available_hotels': available_hotels})


def index(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/index.html', context)

def get_context(hotel_id):
    dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
    conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
    cur = conn.cursor()
    sql = "SELECT * FROM HOTEL WHERE hotelId=" + str(hotel_id)
    cur.execute(sql)
    result = cur.fetchone()

    if result is None:
        raise Http404("Invalid hotel")
    else:
        hotel = Hotel(hotelId=result[0], name=result[1], street=result[2], zipcode=result[3],
                      city=result[4], country=result[5], rating=result[6], rating_count=result[7])
        hotel_facilities = get_facilities(hotel_id, conn)
        hotel_services = get_services(hotel_id, conn)
        room_types = get_rooms(hotel_id, conn)
        context = {'hotel': hotel, 'hotel_facilities': hotel_facilities , 'hotel_services': hotel_services}

        if len(room_types):
            context['room_types'] = room_types

    return context


def get_facilities(hotel_id, conn):

    cur = conn.cursor()
    sql = "SELECT facilities FROM HOTEL_FACILITY WHERE hotelId=" + str(hotel_id)
    cur.execute(sql)
    result = cur.fetchall()
    hotel_facilities = []
    for row in result:
        hotel_facilities.append(row[0])
    return hotel_facilities

def get_services(hotel_id, conn):

    cur = conn.cursor()
    sql = "SELECT SERVICE_TYPE FROM SERVICE WHERE hotelId=" + str(hotel_id)
    cur.execute(sql)
    result = cur.fetchall()
    hotel_services = set()
    for row in result:
        hotel_services.add(row[0])
    return hotel_services


def get_rooms(hotel_id, conn):

    cur = conn.cursor()
    sql = "SELECT roomId, room_type, bed_type, cost_per_day, discount, special_offer FROM ROOM WHERE hotelId="\
          + str(hotel_id)
    cur.execute(sql)
    result = cur.fetchall()
    type_map = []
    room_type_set = []
    for row in result:
        room = Room(row[0], row[1], row[2], row[3], row[4], row[5])
        if room.room_type not in type_map:
            room.add_facilities(get_room_facilities(room.roomId, conn))
            room_type_set.append(room)
            type_map.append(room.room_type)

    return room_type_set


def get_room_facilities(room_id, conn):

    cur = conn.cursor()
    sql = "SELECT facilities FROM ROOM_FACILITY WHERE roomId=" + str(room_id)
    cur.execute(sql)
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
    return render(request, 'hotel/contact.html')



