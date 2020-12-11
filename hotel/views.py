from datetime import datetime
from django.shortcuts import render, redirect
from django.http import Http404
from .models import Hotel, Room, Service, Session , Reservation
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from django.db import connection
from random import randint
from dashboard.models import Customer

from django.core.mail import EmailMultiAlternatives
from easy_pdf.rendering import render_to_pdf

from django.conf import settings
import math

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

    request.session['checkin_input'] = checkin_input
    request.session['checkout_input'] = checkout_input

    logged_in = request.session.has_key('customer_id')

    available_hotels = []

    with connection.cursor() as cur:

        sql = "SELECT H.HOTELID, H.NAME, H.STREET, H.ZIPCODE, H.CITY, H.COUNTRY, H.RATING, H.RATINGCOUNT, " \
              "(SELECT COUNT(R.ROOMID) FROM ROOM R WHERE R.HOTELID = H.HOTELID)," \
              "(SELECT COUNT(DISTINCT RR.ROOMID) FROM RESERVATION RS, RESERVATION_ROOM RR WHERE " \
              "RS.HOTELID = H.HOTELID AND RS.RESERVATIONID = RR.RESERVATIONID AND " \
              "(RS.DATE_OF_ARRIVAL <= TO_DATE(%s, 'YYYY-MM-DD') " \
              "AND RS.DATE_OF_DEPARTURE >= TO_DATE(%s, 'YYYY-MM-DD'))) " \
              "FROM HOTEL H " \
              "WHERE UPPER(CITY) = %s OR UPPER(COUNTRY) = %s ORDER BY H.RATING DESC"
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
    context = get_context(request,hotel_id)
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
    
    request.session['checkin'] = checkin_input
    request.session['checkout'] = checkout_input

    request.session['checkin_input'] = checkin_input
    request.session['checkout_input'] = checkout_input

    context = get_context(request, hotel_id)

    return render(request, 'hotel/book2.html', context)


@csrf_exempt
def payment_method(request, hotel_id):
    context = get_context(request,hotel_id)
    context['message'] = "Choose Payment Method"
    return render(request, 'hotel/payment_method.html',context)


@csrf_exempt
def mobile_banking(request, hotel_id):

    if request.session.has_key('customer_id'):
        logged_in = True
        customer_id = request.session['customer_id']
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    context = get_context(request,hotel_id)
    context['total_cost'] = request.session['total_cost']
    context['logged_in'] = logged_in

    context['message'] = "Do you want to fetch info from wallet ?"
    return render(request, 'hotel/mobile_banking.html',context)

@csrf_exempt
def mobile_banking_fetch(request, hotel_id):
    if request.session.has_key('customer_id'):
        logged_in = True
        customer_id = request.session['customer_id']
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    context = get_context(request,hotel_id)
    context['total_cost'] = request.session['total_cost']
    context['logged_in'] = logged_in
    print('fetching...')


    global customer
    get_customer_info(customer_id)
    context['customer'] = customer

    return render(request, 'hotel/mobile_banking.html',context)

@csrf_exempt
def credit_card(request, hotel_id):

    if request.session.has_key('customer_id'):
        logged_in = True
        customer_id = request.session['customer_id']
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    context = get_context(request,hotel_id)
    context['total_cost'] = request.session['total_cost']
    context['logged_in'] = logged_in

    context['message'] = "Do you want to fetch info from wallet ?"
    return render(request, 'hotel/credit_card.html',context)

@csrf_exempt
def credit_card_fetch(request, hotel_id):

    if request.session.has_key('customer_id'):
        logged_in = True
        customer_id = request.session['customer_id']
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    context = get_context(request,hotel_id)
    context['total_cost'] = request.session['total_cost']
    context['logged_in'] = logged_in


    global customer
    get_customer_info(customer_id)
    context['customer'] = customer

    return render(request, 'hotel/credit_card.html',context)


def get_customer_info(customer_id):

    with connection.cursor() as cur:
        cur.execute("SELECT  NAME , EMAIL , USERNAME , GENDER , STREET , ZIPCODE , CITY , COUNTRY , "
                    "PHONE_NUM , ISVERIFIED FROM CUSTOMER WHERE customerId = %s",[customer_id])
        result = cur.fetchone()
        global customer
        customer = Customer(customer_id=customer_id, name=result[0], email=result[1], username=result[2],
                                gender=result[3], street=result[4], zipcode=result[5], city=result[6],
                                country=result[7], phone=result[8], isVerified=result[9])

        cur.execute("SELECT  CARD_NUMBER , CARD_USERNAME , CARD_TYPE , CVC , EXPIRATION  FROM CREDIT_CARD "
                    "WHERE customerId = %s",[customer_id])
        result = cur.fetchone()

        if result:

            customer.card_number = result[0]
            customer.card_username = result[1]
            customer.card_type = result[2]
            customer.cvc = result[3]
            customer.expiration = result[4]

        cur.execute("SELECT  PHONE_NUMBER , SERVICE_PROVIDER , CUSTOMERID FROM MOBILE_BANKING "
                        "WHERE customerId = %s",[customer_id])
        result = cur.fetchone()
        if result:
            customer.mob_banking_phone_number = result[0]
            customer.mob_banking_service_provider = result[1]

@csrf_exempt
def payment(request, hotel_id):

    if request.session.has_key('customer_id'):
        logged_in = True
        customer_id = request.session['customer_id']
        print(customer_id)
    else:
        messages.success(request, 'you must log in first')
        return redirect('login:index')

    get_customer_info(customer_id)

    context = get_context(request,hotel_id)

    checkin_input = request.session['checkin_input']
    checkout_input = request.session['checkout_input']

    checkin_date_ymd = datetime.strptime(checkin_input, "%Y-%m-%d").date()
    checkin_date = checkin_date_ymd.strftime('%d %b,%Y')

    checkout_date_ymd = datetime.strptime(checkout_input, "%Y-%m-%d").date()
    checkout_date = checkout_date_ymd.strftime('%d %b,%Y')

    delta = checkout_date_ymd - checkin_date_ymd
    stay = delta.days

    total_cost = 0

    room_count = {}

    for room in context['room_types']:
        room_count[room.room_type+"_count"] = request.POST.get(room.room_type+"_count")
        room_count[room.room_type + "_count"] = 0 if room_count[room.room_type + "_count"]==None else int(room_count[room.room_type + "_count"])
        cost_per_day = room_count[room.room_type + "_count"] * room.cost * (room.discount/100.0)
        total_cost += cost_per_day*stay

        request.session[room.room_type + "_count"] = room_count[room.room_type + "_count"]
        print("Room Types : " , room.room_type , " , Count : ",room_count[room.room_type+"_count"] , ", Cost , ",room.cost , " ,Discount",room.discount , ",Cost Per Day ",cost_per_day)

    service_count = {}

    for service_type in context['hotel_services']:
        print("Service Type , ", service_type)
        for service_list in context['hotel_services'][service_type]:
            sub_type = service_list.service_subtype
            service_count[sub_type+"_count"] = request.POST.get(sub_type+"_count")
            service_count[sub_type+"_count"] = 0 if service_count[sub_type+"_count"] == None else int(service_count[sub_type+"_count"])
            cost = service_count[sub_type+"_count"] * service_list.cost
            total_cost += cost

            request.session[sub_type+"_count"] = service_count[sub_type+"_count"]
            print("Sub Service",sub_type , "Count ",service_count[sub_type+"_count"] , "Cost ",service_list.cost)

    # request.session['service_sub_type'] = service_sub_type

    context['total_cost'] = math.ceil(total_cost)
    request.session['total_cost'] = context['total_cost']

    print(context['total_cost'])

    context['logged_in'] = logged_in
    global customer
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
        context = get_context(request, hotel_id)

        booked_room_id = []
        booked_rooms = []
        book_cnt = 0

        for r in context['room_types']:
            need_room_cnt = request.session[r.room_type+"_count"]
            print("Need : ",need_room_cnt)
            for idx in range(need_room_cnt):
                book_cnt += 1
                booked_room_id.append(r.roomId[idx])
                temp = Room(r.room_type,r.bed_type,r.cost,r.discount,r.roomId[idx])
                booked_rooms.append(temp)
                print(temp)

        print(booked_room_id)
        for b in booked_rooms:
            print(b)

        reservation_id = cur.callfunc('GENERATE_ID', int, ['RESERVATION', 'RESERVATIONID'])
        payment_id = cur.callfunc('GENERATE_ID', int, ['PAYMENT', 'PAYMENTID'])

        booked_services = []

        for service_type in context['hotel_services']:
            print("Service Type , ", service_type)
            for service_list in context['hotel_services'][service_type]:
                sub_type = service_list.service_subtype
                count = request.session[sub_type + "_count"]
                cost = count * service_list.cost
                s = Service(serviceId=service_list.serviceId, service_type=service_type, service_subtype=sub_type, cost=cost, count=count)

                if s.count > 0:
                    booked_services.append(s)

                print(s.serviceId, "Sub ", s.service_subtype," Cost ",s.cost," Count",s.count)

    context['checkin_input'] = request.session['checkin_input']
    context['checkout_input'] = request.session['checkout_input']
    context['customer'] = customer
    context['reservation_id'] = reservation_id
    context['payment_id'] = payment_id
    context['total_cost'] = request.session['total_cost']
    context['booked_rooms'] = booked_rooms
    context['booked_services'] = booked_services

    r = Reservation(reservationid=reservation_id, date_of_arrival= context['checkin_input'],
                    date_of_departure=context['checkout_input'], customerid=customer_id,
                    paymentid=payment_id, hotelid = hotel_id,
                    reservation_charge=context['total_cost'])

    print(r)

    context['reservation_list'] = r

    with connection.cursor() as cur:
        sql_add_payment = "INSERT INTO PAYMENT " \
                          "VALUES (%s, SYSDATE)"
        cur.execute(sql_add_payment, [payment_id])
        connection.commit()
        sql_add_reservation = "INSERT INTO RESERVATION (RESERVATIONID, DATE_OF_ARRIVAL, DATE_OF_DEPARTURE, CUSTOMERID, " \
                              "PAYMENTID, HOTELID, RESERVATION_CHARGE) " \
                              "VALUES ( %s, %s, %s , %s , %s , %s , %s )"
        cur.execute(sql_add_reservation,
                    [r.reservationid, r.date_of_arrival, r.date_of_departure, r.customerid, r.paymentid, r.hotelid,
                     r.reservation_charge])
        connection.commit()

    with connection.cursor() as cur:

        for r in booked_room_id:
            print(r, reservation_id)
            sql_add_room = "INSERT INTO RESERVATION_ROOM VALUES(%s, %s)"
            cur.execute(sql_add_room, [reservation_id, r])
            connection.commit()

        for s in booked_services:
            cur.execute("INSERT INTO RESERVATION_SERVICE VALUES(%s, %s, %s)", [reservation_id, s.serviceId, s.count])
            connection.commit()

    send_booking_mail(context)

    return redirect('dashboard:maps')


def send_booking_mail(context):

    post_pdf = render_to_pdf('hotel/testPDF.html', context)
    global customer

    email_subject = "innOcity Booking Confirmation"
    email_body = "Your booking has been successfully completed . Find your booking pass in the attachment. \n Regrads, \n innOcity Team"

    msg = EmailMultiAlternatives(email_subject, email_body, settings.EMAIL_HOST_USER,
                                 [customer.email])
    msg.attach('Booking Pass.pdf', post_pdf)
    msg.send()
    return


def book(request, hotel_id):
    context = get_context(request, hotel_id)
    context['checkin'] = request.session['checkin_input']
    context['checkout'] = request.session['checkout_input']
    return render(request, 'hotel/book.html', context)


def get_context(request, hotel_id):
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
            room_types = get_rooms(request, hotel_id)
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


def get_rooms(request, hotel_id):

    with connection.cursor() as cur:
        if request.session.has_key('checkin_input'):

            checkin_date = request.session['checkin_input']
            checkout_date = request.session['checkout_input']

            sql = "SELECT R.ROOMID, RT.ROOMTYPE_NAME, RT.BED_TYPE, RT.COST_PER_DAY, RT.DISCOUNT " \
                  "FROM ROOM R, ROOM_TYPE RT WHERE R.HOTELID = %s AND R.ROOMTYPEID = RT.ROOMTYPEID AND " \
                  "R.ROOMID NOT IN (SELECT RR.ROOMID FROM RESERVATION RS, RESERVATION_ROOM RR " \
                  "WHERE RS.RESERVATIONID = RR.RESERVATIONID AND RS.HOTELID = %s " \
                  "AND RS.DATE_OF_ARRIVAL <= TO_DATE(%s, 'YYYY-MM-DD') AND " \
                  "RS.DATE_OF_DEPARTURE >= TO_DATE(%s, 'YYYY-MM-DD')) "
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
    context = get_context(request,hotel_id)
    return render(request, 'hotel/rooms.html', context)


def services(request, hotel_id):
    context = get_context(request, hotel_id)
    return render(request, 'hotel/services.html', context)


def about(request, hotel_id):
    return render(request, 'hotel/about.html')


def blog(request, hotel_id):
    return render(request, 'hotel/blog.html')


def blog_single(request, hotel_id):
    return render(request, 'hotel/blog-single.html')


def contact(request, hotel_id):
    context = get_context(request,hotel_id)
    return render(request, 'hotel/contact.html', context)
