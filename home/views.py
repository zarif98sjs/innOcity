from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.db import connection
from hotel.models import Hotel

import login.views
app_name = 'home'


def index(request):

    if request.session.has_key('customer_id'):
        logged_in = True
    else:
        logged_in = False

    hotel_ara_best = best_rated()
    top_discount_ara = top_discount()
    destination = get_destination()

    return render(request, 'home/index.html',
                  {'hotel_ara_best': hotel_ara_best, 'hotel_ara_top_disc': top_discount_ara,
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
        dest = [row[0] for row in result] + [row[1] for row in result]
        return dest


def best_rated():

    with connection.cursor() as cur:

        sql = "SELECT * FROM " \
              "(SELECT * FROM HOTEL ORDER BY RATING DESC) " \
              "WHERE ROWNUM <= 6"
        cur.execute(sql)
        result = cur.fetchall()
        hotel_ara = []

        for row in result:

            h = Hotel(hotelId=row[0], name=row[1], street=row[2], zipcode=row[3], city=row[4],
                                   country=row[5], rating=row[6], rating_count=row[7])
            hotel_ara.append(h)

        return hotel_ara


def top_discount():

    with connection.cursor() as cur:

        sql = "SELECT * FROM " \
              "(SELECT H.*, R.ROOM_TYPE, R.DISCOUNT FROM HOTEL H, ROOM R " \
              "WHERE R.HOTELID = H.HOTELID " \
              "ORDER BY R.DISCOUNT DESC) " \
              "WHERE ROWNUM <= 6"
        cur.execute(sql)
        result = cur.fetchall()

        hotel_ara = []

        for row in result:
            h = Hotel(hotelId=row[0], name=row[1], street=row[2], zipcode=row[3],
                      city=row[4], country=row[5], rating=row[6], rating_count=row[7])
            hotel_ara.append((h, row[8], row[9]))

        return hotel_ara


def about(request):
    return render(request, 'home/about.html')


def contacts(request):
    return render(request, 'home/payment.html')
