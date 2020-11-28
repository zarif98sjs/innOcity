from datetime import datetime
from django.shortcuts import render, redirect
from django.http import Http404
from .models import Hotel, Room, Service, Session , Reservation
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from django.db import connection
from random import seed
from random import randint
from dashboard.models import Customer

from django.core.mail import EmailMultiAlternatives
from easy_pdf.rendering import render_to_pdf

from django.conf import settings

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

    request.session['checkin_input'] = checkin_input
    request.session['checkout_input'] = checkout_input

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
def book2(request, hotel_id):
    if request.session.has_key('customer_id'):
        logged_in = True
        customer_id = request.session['customer_id']
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    checkin_input = request.POST.get('checkin')
    checkout_input = request.POST.get('checkout')

    request.session['checkin_input'] = checkin_input
    request.session['checkout_input'] = checkout_input

    context = get_context(hotel_id)

    return render(request, 'hotel/book2.html', context)

@csrf_exempt
def payment_method(request, hotel_id):
    context = get_context(hotel_id)
    return render(request, 'hotel/payment_method.html',context)

@csrf_exempt
def mobile_banking(request, hotel_id):

    if request.session.has_key('customer_id'):
        logged_in = True
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    context = get_context(hotel_id)
    context['total_cost'] = request.session['total_cost']
    context['logged_in'] = logged_in

    return render(request, 'hotel/mobile_banking.html',context)

@csrf_exempt
def credit_card(request, hotel_id):

    if request.session.has_key('customer_id'):
        logged_in = True
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    context = get_context(hotel_id)
    context['total_cost'] = request.session['total_cost']
    context['logged_in'] = logged_in

    return render(request, 'hotel/credit_card.html',context)

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
                                gender=result[5], street=result[6], zipcode=result[7], city=result[8],
                                country=result[9])

    context = get_context(hotel_id)

    checkin_input = request.session['checkin_input']
    checkout_input = request.session['checkout_input']

    checkin_date_ymd = datetime.strptime(checkin_input, "%Y-%m-%d").date()
    checkin_date = checkin_date_ymd.strftime('%d %b,%Y')
    print(checkin_date)

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

    service_sub_type = {}
    service_sub_type['Business Meeting'] = request.POST.get('Business Meeting')
    service_sub_type['Food'] = request.POST.get('Food')
    service_sub_type['Transport'] = request.POST.get('Transport')

    request.session['Business Meeting Type'] = service_sub_type['Business Meeting']
    request.session['Food Type'] = service_sub_type['Food']
    request.session['Transport Type'] = service_sub_type['Transport']

    service_sub_type_cnt = {}

    service_sub_type_cnt[0] = request.POST.get('Business Meeting_cnt')
    service_sub_type_cnt[1] = request.POST.get('Food_cnt')
    service_sub_type_cnt[2] = request.POST.get('Transport_cnt')

    print(service_sub_type)

    for i in range(5):
        if room_cnt[i] == None:
            room_cnt[i] = 0
        else:
            room_cnt[i] = int(room_cnt[i])

    request.session['Studio'] = room_cnt[0]
    request.session['Regular'] = room_cnt[1]
    request.session['Presidential Suite'] = room_cnt[2]
    request.session['Suite'] = room_cnt[3]
    request.session['Villa'] = room_cnt[4]

    for i in range(3):
        if service_sub_type_cnt[i] == None:
            service_sub_type_cnt[i] = 0
        else:
            service_sub_type_cnt[i] = int(service_sub_type_cnt[i])

    request.session['Business Meeting'] = service_sub_type_cnt[0]
    request.session['Food'] = service_sub_type_cnt[1]
    request.session['Transport'] = service_sub_type_cnt[2]

    print(room_cnt)

    with connection.cursor() as cur:
        sql = "SELECT ROOMTYPE_NAME , COST_PER_DAY , DISCOUNT FROM ROOM_TYPE WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()

        if result is None:
            raise Http404("Invalid hotel")
        else:
            for r in result:
                context[r[0]] = r[1] * (1 - r[2] / 100)

        sql = "SELECT SERVICE_SUBTYPE , COST FROM SERVICE WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()

        if result is None:
            raise Http404("Invalid hotel")
        else:
            for r in result:
                context[r[0]] = r[1]

        total_cost = 0
        total_cost += room_cnt[0] * context.get('Studio', 0)
        total_cost += room_cnt[1] * context.get('Regular', 0)
        total_cost += room_cnt[2] * context.get('Presidential Suite', 0)
        total_cost += room_cnt[3] * context.get('Suite', 0)
        total_cost += room_cnt[4] * context.get('Villa', 0)
        total_cost = total_cost * stay

        request.session['service_sub_type'] = service_sub_type

        total_cost += service_sub_type_cnt[0] * context.get(service_sub_type['Business Meeting'], 0)
        total_cost += service_sub_type_cnt[1] * context.get(service_sub_type['Food'], 0)
        total_cost += service_sub_type_cnt[2] * context.get(service_sub_type['Transport'], 0)

        context['total_cost'] = total_cost
        request.session['total_cost'] = total_cost

        print(context['total_cost'])

        context['logged_in'] = logged_in
        context['customer'] = customer

    return render(request, 'hotel/payment_method.html', context)


@csrf_exempt
def complete_payment(request, hotel_id):
    ## check if rooms are available in the given time , update reservation , update payment , send mail

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
                                gender=result[5], street=result[6], zipcode=result[7], city=result[8],
                                country=result[9])

        context = get_context(hotel_id)

        book_room_id = []
        booked_rooms = []
        book_cnt = 0

        for r in context['room_types']:
            need_room_cnt = request.session[r.room_type]
            print("Need : ",need_room_cnt)
            for idx in range(need_room_cnt):
                book_cnt += 1
                book_room_id.append(r.roomId[idx])
                temp = r
                temp.singleId = r.roomId[idx]
                booked_rooms.append(temp)
                print(temp)

        print(book_room_id)
        for b in booked_rooms:
            print(b)

        sql = "SELECT RESERVATIONID FROM RESERVATION"
        cur.execute(sql)
        result = cur.fetchall()
        reservation_ids = [row[0] for row in result]

        book_reservation_id = []

        for idx in range(book_cnt):
            reservation_id = 0
            while True:
                reservation_id = randint(10000000, 99999999)
                if reservation_id not in reservation_ids:
                    book_reservation_id.append(reservation_id)
                    reservation_ids.append(reservation_id)
                    break

        print(book_reservation_id)

        sql = "SELECT SERVICE_SUBTYPE , COST FROM SERVICE WHERE hotelId= %s"
        cur.execute(sql, [hotel_id])
        result = cur.fetchall()

        if result is None:
            raise Http404("Invalid hotel")
        else:
            for r in result:
                context[r[0]] = r[1]

        booked_services = []

        for service_type in context['hotel_services']:
            cnt = request.session[service_type]
            sub = request.session[service_type + " Type"]
            cost = context.get(request.session['service_sub_type'][service_type], 0)
            cost *= cnt
            s = Service(-1,service_type = service_type,service_subtype=sub,cost = cost,count=cnt)
            booked_services.append(s)
            print(service_type)
            print(sub)
            print(cost)

        sql = "SELECT PAYMENTID FROM PAYMENT"
        cur.execute(sql)
        result = cur.fetchall()
        payment_ids = [row[0] for row in result]

        payment_id = 0
        while True:
            payment_id = randint(10000000, 99999999)
            if payment_id not in payment_ids:
                break

    context['checkin_input'] = request.session['checkin_input']
    context['checkout_input'] = request.session['checkout_input']
    context['customer'] = customer
    context['reservation_id'] = reservation_id
    context['payment_id'] = payment_id
    context['total_cost'] = request.session['total_cost']
    context['booked_rooms'] = booked_rooms
    context['booked_services'] = booked_services

    reservation_list = []

    for id in range(book_cnt):
        resrvation = Reservation(reservationid = book_reservation_id[id], date_of_arrival= context['checkin_input'], date_of_departure=context['checkout_input'] , customerid=customer_id,paymentid=payment_id,hotelid = hotel_id,roomid=book_room_id[id],reservation_charge=context['total_cost'])
        reservation_list.append(resrvation)
        print(resrvation)

    context['reservation_list'] = reservation_list

    # send_booking_mail(context)

    return redirect('dashboard:index')

def send_booking_mail(context):

    post_pdf = render_to_pdf('hotel/testPDF.html', context)

    email_subject = "innOcity Booking Confirmation"
    email_body = "Your booking has been successfully completed . Find your booking pass in the attachment. \n Regrads, \n innOcity Team"

    msg = EmailMultiAlternatives(email_subject, email_body, settings.EMAIL_HOST_USER,
                                 ['zarif98sjs@gmail.com'])
    msg.attach('Booking Pass.pdf', post_pdf)
    msg.send()
    return

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
