from django.shortcuts import render, redirect, reverse
from django.http import HttpResponseRedirect
from django.contrib import messages

from django.shortcuts import render, redirect
from django.db import connection
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
        cur.execute("SELECT * FROM CUSTOMER WHERE customerId = %s", [customer_id])
        result = cur.fetchone()

        if result is None:
            return redirect('login:index')
        else:

            global customer
            customer = Customer(customer_id=customer_id, name=result[1], email=result[2], username=result[3],
                                gender=result[5], street=result[6], zipcode=result[7], city=result[8],
                                country=result[9], phone=result[10])


def wallet(request):

    global customer
    if not request.session.has_key('customer_id'):
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

                    sql = "UPDATE CUSTOMER SET card_username = %s, card_type = %s, card_number= %s , cvc = %s " \
                          "WHERE customerId = %s"
                    cur.execute(sql, [card_username, card_type, card_number, cvc, customer_id])
                    connection.commit()

                    customer.card_username = card_username
                    customer.card_type = card_type
                    customer.card_number = card_number
                    customer.cvc = cvc

                elif request.POST.get("submit_mobile_banking"):

                    customer_id = request.session['customer_id']
                    mob_banking_phone_number = request.POST.get("mob_banking_phone_number")
                    mob_banking_service_provider = request.POST.get("mob_banking_service_provider")

                    sql = "UPDATE CUSTOMER SET mob_banking_phone_number = %s, mob_banking_service_provider = %s " \
                          "WHERE customerId = %s"
                    cur.execute(sql, [mob_banking_phone_number, mob_banking_service_provider, customer_id])
                    connection.commit()

                    customer.mob_banking_phone_number = mob_banking_phone_number
                    customer.mob_banking_service_provider = mob_banking_service_provider

        return render(request, 'dashboard/wallet.html', {'customer': customer})


def maps(request):

    global customer
    if not request.session.has_key('customer_id'):
        return redirect('login:index')
    else:
        if customer.customer_id == 0:
            get_customer(request.session['customer_id'])
        with connection.cursor() as cur:

            sql = "SELECT R.RESERVATIONID, R.DATE_OF_ARRIVAL, R.DATE_OF_DEPARTURE, " \
                  "H.HOTELID, H.NAME, H.CITY, H.COUNTRY, RT.ROOMTYPE_NAME, RT.COST_PER_DAY " \
                  "FROM RESERVATION R, HOTEL H, ROOM RM, ROOM_TYPE RT " \
                  "WHERE R.CUSTOMERID = %s AND R.HOTELID = H.HOTELID AND R.ROOMID = RM.ROOMID " \
                  "AND RM.ROOMTYPEID = RT.ROOMTYPEID " \
                  "ORDER BY R.DATE_OF_ARRIVAL DESC"

            cur.execute(sql, [customer.customer_id])
            result = cur.fetchall()
            reservation_list = []

            for row in result:
                reservation = Reservation(reservation_id=row[0], date_of_arrival=row[1],
                                          date_of_departure=row[2], hotelId=row[3], hotel_name=row[4], city=row[5],
                                          country=row[6], room_type=row[7], cost=row[8])

                sql = "SELECT S.SERVICE_TYPE, S.COST, RS.QUANTITY " \
                      "FROM SERVICE S, RESERVATION_SERVICE RS " \
                      "WHERE S.SERVICEID = RS.SERVICEID AND RS.RESERVATIONID = %s"
                cur.execute(sql, [row[0]])
                all_services = cur.fetchall()

                for service in all_services:

                    reservation.services.append(service[0])
                    reservation.cost += (service[1] * service[2])

                reservation_list.append(reservation)

            return render(request, 'dashboard/maps.html', {'customer': customer, 'reservation_list': reservation_list})


def user(request):

    global customer
    if not request.session.has_key('customer_id'):
        return redirect('login:index')
    else:
        if customer.customer_id == 0:
            get_customer(request.session['customer_id'])
        if request.method == 'POST':

            with connection.cursor() as cur:

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
                    customer = Customer(customer_id=customer_id, name=name, email=email, username=username, gender=customer.gender,
                                        street=street, zipcode=zipcode, city=city, country=country, phone=phone)

                    connection.commit()
                    messages.success(request, "Information Updated")

                elif request.POST.get("submit_password"):

                    cur.execute("SELECT password FROM CUSTOMER WHERE customerId = %s", [customer.customer_id])
                    old_pass_hash = cur.fetchone()[0]
                    input_old_pass = request.POST.get("old_password")
                    input_old_pass_hash = hashlib.md5(input_old_pass.encode()).hexdigest()

                    if input_old_pass_hash != old_pass_hash:
                        return render(request, 'dashboard/user.html', {'customer': customer,
                                                                       'wrong_password': True})
                    else:

                        input_new_pass = request.POST.get("new_password")
                        input_new_pass_hash = hashlib.md5(input_new_pass.encode()).hexdigest()
                        sql = "UPDATE CUSTOMER SET password = %s WHERE customerId = %s"
                        cur.execute(sql, [input_new_pass_hash, customer.customer_id])
                        connection.commit()
                        messages.success(request, "Password Changed")

            return HttpResponseRedirect(reverse('dashboard:user'))

        return render(request, 'dashboard/user.html', {'customer': customer})


