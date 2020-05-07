from django.shortcuts import render
import cx_Oracle
from .models import Hotel

app_name = 'home'


def index(request):

    dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
    conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)

    hotel_ara_best = best_rated(conn)
    hotel_ara_top_disc = top_discount(conn)
    destination = get_destination(conn)
    print(destination)
    return render(request, 'home/index.html',
                  {'hotel_ara_best': hotel_ara_best, 'hotel_ara_top_disc': hotel_ara_top_disc , 'destination': destination})


def about(request):
    return render(request, 'home/about.html')

def get_destination(conn):
    cur = conn.cursor()
    cur.execute("SELECT city,country FROM HOTEL")
    result = cur.fetchall()
    dest = []
    for row in result:
        dest.append(row[0])
        dest.append(row[1])
    return dest

def best_rated(conn):
    cur = conn.cursor()
    cur.execute("SELECT name,city,country,rating,hotelId FROM HOTEL ORDER BY rating DESC ")
    cnt = 1
    hotel_ara = []

    while cnt <= 6:
        row = cur.fetchone()
        # print(row)
        hotel = Hotel()
        hotel.hotelid = row[4]
        hotel.name = row[0]
        hotel.city = row[1]
        hotel.country = row[2]
        hotel.rating = row[3]
        hotel_ara.append(hotel)
        cnt += 1

    return hotel_ara


def top_discount(conn):
    cur = conn.cursor()
    cur2 = conn.cursor()
    cur.execute("SELECT room_type, hotelId, discount FROM ROOM ORDER BY discount DESC")

    cnt = 1
    hotel_ara = []

    while cnt <= 6:
        row1 = cur.fetchone()

        v1 = "SELECT name,city,country,rating FROM HOTEL WHERE hotelId = "
        v2 = row1[1]
        sql = v1+str(v2)
        cur2.execute(sql)
        row2 = cur2.fetchone()

        print(row2)
        hotel = Hotel()
        hotel.hotelid = row1[1]
        hotel.name = row2[0]
        hotel.city = row2[1]
        hotel.country = row2[2]
        hotel.rating = row2[3]
        hotel.top_disc_roomtype = row1[0]
        hotel.top_disc_roomtype_disc = row1[2]
        hotel_ara.append(hotel)
        cnt += 1

    return hotel_ara


def about(request):
    return render(request, 'home/about.html')


def contacts(request):
    return render(request, 'home/contact.html')


def destinations(request):
    return render(request, 'home/destinations.html')


def news(request):
    return render(request, 'home/news.html')



