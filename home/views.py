
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.db import connection
from hotel.models import Hotel

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
              "(SELECT H.HOTELID, H.NAME, H.STREET, H.ZIPCODE, H.CITY, H.COUNTRY, H.RATING, H.RATINGCOUNT, " \
              "RT.ROOMTYPE_NAME, RT.DISCOUNT " \
              "FROM HOTEL H, ROOM R, ROOM_TYPE RT " \
              "WHERE R.HOTELID = H.HOTELID AND R.ROOMTYPEID = RT.ROOMTYPEID " \
              "ORDER BY RT.DISCOUNT DESC) " \
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
