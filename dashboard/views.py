from datetime import datetime
from django.shortcuts import render, redirect
from django.db import connection
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
import hashlib
from .models import Customer, Reservation
from hotel.models import Hotel
import json

app_name = 'dashboard'

customer = Customer(0)
hotel = Hotel(0)


def index(request):

    if request.session.has_key('customer_id'):
        customer_id = request.session['customer_id']

    else:
        messages.success(request, "You must log in first")
        return redirect('login:index')

    global customer
    get_customer(customer_id)
    locations = []
    hotels = []
    with connection.cursor() as cur2:

        sql = "SELECT H.name, H.city, H.country FROM HOTEL H, RESERVATION R WHERE R.customerId = %s " \
                "AND H.hotelId = R.hotelId"
        cur2.execute(sql, [customer.customer_id])
        rows = cur2.fetchall()

        for row in rows:
            hotels.append(row[0] + " " + row[1] + ", " + row[2])
            locations.append(row[1] + ", " + row[2])

    return render(request, 'dashboard/index.html', {'customer': customer, "locations": json.dumps(locations),
                                                    "hotels": json.dumps(hotels)})


def get_customer(customer_id):

    with connection.cursor() as cur:
        cur.execute("SELECT  NAME , EMAIL , USERNAME , GENDER , STREET , ZIPCODE , CITY , COUNTRY , PHONE_NUM , "
                    "ISVERIFIED FROM CUSTOMER WHERE customerId = %s", [customer_id])
        result = cur.fetchone()

        if result is None:
            return
        else:

            global customer
            customer = Customer(customer_id=customer_id, name=result[0], email=result[1], username=result[2],
                                gender=result[3], street=result[4], zipcode=result[5], city=result[6],
                                country=result[7], phone=result[8], isVerified=result[9])

            get_wallet_info(customer_id)


def get_wallet_info(customer_id):
    with connection.cursor() as cur:
        cur.execute("SELECT  CARD_NUMBER , CARD_USERNAME , CARD_TYPE , CVC , EXPIRATION  FROM CREDIT_CARD "
                    "WHERE customerId = %s", [customer_id])
        result = cur.fetchone()

        if result is None:
            return
        else:

            global customer
            customer.card_number = result[0]
            customer.card_username = result[1]
            customer.card_type = result[2]
            customer.cvc = result[3]
            customer.expiration = result[4]

        cur.execute("SELECT  PHONE_NUMBER , SERVICE_PROVIDER , CUSTOMERID FROM MOBILE_BANKING "
                    "WHERE customerId = %s",
            [customer_id])
        result = cur.fetchone()

        if result is None:
            return redirect('login:index')
        else:

            customer.mob_banking_phone_number = result[0]
            customer.mob_banking_service_provider = result[1]


def wallet(request):

    global customer
    if not request.session.has_key('customer_id'):
        messages.success(request, "You must log in first")
        return redirect('login:index')
    else:
        if customer.customer_id == 0:
            get_customer(request.session['customer_id'])

        if request.method == 'POST':

            with connection.cursor() as cur:

                if request.POST.get("submit_credit_card"):

                    customer_id = request.session['customer_id']
                    card_username = request.POST.get("card_username")
                    card_type = request.POST.get("card_type")
                    card_number = request.POST.get("card_number")
                    cvc = request.POST.get("cvc")
                    expiration = request.POST.get("expiration")

                    sql = "INSERT INTO CREDIT_CARD (card_number, card_username, card_type, cvc, " \
                            "expiration, customerid) " \
                            "VALUES ( %s, %s, %s , %s , %s , %s )"

                    cur.execute(sql, [card_number, card_username, card_type, cvc, expiration ,customer_id])
                    connection.commit()

                    customer.card_username = card_username
                    customer.card_type = card_type
                    customer.card_number = card_number
                    customer.cvc = cvc
                    customer.expiration = expiration

                elif request.POST.get("submit_mobile_banking"):

                    customer_id = request.session['customer_id']
                    mob_banking_phone_number = request.POST.get("mob_banking_phone_number")
                    mob_banking_service_provider = request.POST.get("mob_banking_service_provider")

                    sql = "INSERT INTO MOBILE_BANKING (phone_number, service_provider, customerid)" \
                            "VALUES ( %s, %s, %s )"

                    cur.execute(sql, [mob_banking_phone_number, mob_banking_service_provider, customer_id])
                    connection.commit()

                    customer.mob_banking_phone_number = mob_banking_phone_number
                    customer.mob_banking_service_provider = mob_banking_service_provider

        return render(request, 'dashboard/wallet.html', {'customer': customer})


def maps(request):

    global customer
    if not request.session.has_key('customer_id'):
        messages.success(request, "You must log in first")
        return redirect('login:index')
    else:
        if customer.customer_id == 0:
            get_customer(request.session['customer_id'])
        with connection.cursor() as cur:

            if request.method == 'POST':
                reservation_id = request.POST.get("reservation_id")
                rate = request.POST.get("rate")

                sql = "UPDATE RESERVATION SET RATING = %s WHERE RESERVATIONID = %s"
                cur.execute(sql, [rate, reservation_id])
                connection.commit()
                return HttpResponseRedirect(reverse('dashboard:maps'))

            sql = "SELECT RS.RESERVATIONID, RS.DATE_OF_ARRIVAL, RS.DATE_OF_DEPARTURE, RS.RESERVATION_CHARGE, " \
                  "H.HOTELID, H.NAME, H.CITY, H.COUNTRY, RS.RATING " \
                  "FROM RESERVATION RS, HOTEL H " \
                  "WHERE RS.CUSTOMERID = %s AND RS.HOTELID = H.HOTELID " \
                  "ORDER BY RS.DATE_OF_ARRIVAL DESC"

            cur.execute(sql, [customer.customer_id])
            result = cur.fetchall()
            cur.execute("SELECT SYSDATE FROM DUAL")
            today = cur.fetchone()[0]

            reservation_list = []

            for row in result:

                reservation = Reservation(reservation_id=row[0], date_of_arrival=row[1],
                                          date_of_departure=row[2], reservation_charge=row[3],
                                          hotelId=row[4], hotel_name=row[5], city=row[6],
                                          country=row[7], rating=row[8])
                sql = "SELECT RT.ROOMTYPE_NAME " \
                      "FROM ROOM_TYPE RT, RESERVATION_ROOM RR, ROOM RM " \
                      "WHERE RR.RESERVATIONID = %s AND RR.ROOMID = RM.ROOMID AND RM.ROOMTYPEID = RT.ROOMTYPEID "
                cur.execute(sql, [reservation.reservation_id])
                res = cur.fetchall()

                reservation.room_types = [r[0] for r in res]

                if reservation.date_of_departure >= datetime.date(today):
                    reservation.passed = False

                sql = "SELECT S.SERVICE_SUBTYPE, S.COST, RS.QUANTITY " \
                      "FROM SERVICE S, RESERVATION_SERVICE RS " \
                      "WHERE S.SERVICEID = RS.SERVICEID AND RS.RESERVATIONID = %s"
                cur.execute(sql, [row[0]])
                all_services = cur.fetchall()

                for service in all_services:

                    reservation.services.append(service[0])
                    reservation.service_charge += (service[1] * service[2])

                reservation_list.append(reservation)

            return render(request, 'dashboard/maps.html', {'customer': customer, 'reservation_list': reservation_list})


def user(request):

    global customer
    if not request.session.has_key('customer_id'):
        return redirect('login:index')
    else:
        if customer.customer_id == 0:
            get_customer(request.session['customer_id'])
        with connection.cursor() as cur:

            if request.method == 'POST':

                if request.POST.get("submit_personal"):

                    customer_id = request.session['customer_id']
                    name = request.POST.get("name")
                    email = request.POST.get("email")
                    username = request.POST.get("username")
                    phone = request.POST.get("phone")
                    street = request.POST.get("street")
                    zipcode = request.POST.get("zipcode")
                    city = request.POST.get("city")
                    country = request.POST.get("country")

                    sql = "UPDATE CUSTOMER SET name = %s, email = %s, username= %s, phone_num = %s, street = %s," \
                          "zipcode = %s, city = %s, country = %s WHERE customerId = %s"
                    cur.execute(sql, [name, email, username, phone, street, zipcode, city, country, customer_id])
                    connection.commit()
                    customer = Customer(customer_id=customer_id, name=name, email=email, username=username,
                                        phone=phone, street=street, zipcode=zipcode, city=city,
                                        country=country)

                    messages.success(request, "Information updated successfully")

                elif request.POST.get("submit_password"):

                    cur.execute("SELECT password FROM CUSTOMER WHERE customerId = %s", [customer.customer_id])
                    old_pass_hash = cur.fetchone()[0]
                    input_old_pass = request.POST.get("old_password")
                    input_old_pass_hash = hashlib.md5(input_old_pass.encode()).hexdigest()

                    if input_old_pass_hash != old_pass_hash:
                        messages.success(request, "wrong password")
                    else:

                        input_new_pass = request.POST.get("new_password")
                        input_new_pass_hash = hashlib.md5(input_new_pass.encode()).hexdigest()
                        sql = "UPDATE CUSTOMER SET password = %s WHERE customerId = %s"
                        cur.execute(sql, [input_new_pass_hash, customer.customer_id])
                        connection.commit()
                        messages.success(request, "Password updated successfully")

                return HttpResponseRedirect(reverse('dashboard:user'))

        return render(request, 'dashboard/user.html', {'customer': customer})
