from .models import Hotel
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
from django.db import connection
import hotel

import login.views
app_name = 'home'


def index(request):

    logged_in = (login.views.customer_id != 0)

    hotel_ara_best = best_rated()
    hotel_ara_top_disc = top_discount()
    destination = get_destination()

    return render(request, 'home/index.html',
                  {'hotel_ara_best': hotel_ara_best, 'hotel_ara_top_disc': hotel_ara_top_disc,
                   'destination': destination, 'logged_in': logged_in})


@csrf_exempt
def payment(request):
    # checkin_input = request.POST.get('checkin')
    # checkin_date_ymd = datetime.strptime(checkin_input, "%Y-%m-%d").date()
    # checkin_date = checkin_date_ymd.strftime('%d %b,%Y')
    # print(checkin_date)
    # room_types = hotel.views.get_rooms(107)
    # print(room_types)

    return render(request, 'home/payment.html')


def get_destination():

    with connection.cursor() as cur:
        cur.execute("SELECT city,country FROM HOTEL")
        result = cur.fetchall()
        dest = []
        for row in result:
            dest.append(row[0])
            dest.append(row[1])
        return dest


def best_rated():

    with connection.cursor() as cur:
        cur.execute("SELECT name,city,country,rating,hotelId FROM HOTEL ORDER BY rating DESC ")
        cnt = 1
        hotel_ara = []

        while cnt <= 6:
            row = cur.fetchone()
            hotel = Hotel()
            hotel.hotelid = row[4]
            hotel.name = row[0]
            hotel.city = row[1]
            hotel.country = row[2]
            hotel.rating = row[3]
            hotel_ara.append(hotel)
            cnt += 1

        return hotel_ara


def top_discount():

    with connection.cursor() as cur:

        cur.execute("SELECT room_type, hotelId, discount FROM ROOM ORDER BY discount DESC")
        rows = cur.fetchall()
        cnt = 1
        hotel_ara = []

        for row in rows:
            if cnt > 6:
                break

            sql = "SELECT name,city,country,rating FROM HOTEL WHERE hotelId = %s"
            cur.execute(sql, [row[1]])
            row2 = cur.fetchone()

            hotel = Hotel()
            hotel.hotelid = row[1]
            hotel.name = row2[0]
            hotel.city = row2[1]
            hotel.country = row2[2]
            hotel.rating = row2[3]
            hotel.top_disc_roomtype = row[0]
            hotel.top_disc_roomtype_disc = row[2]
            hotel_ara.append(hotel)
            cnt += 1

        return hotel_ara


def about(request):
    return render(request, 'home/about.html')


def contacts(request):
    return render(request, 'home/payment.html')







