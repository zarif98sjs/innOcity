from django.shortcuts import render, redirect
from django.db import connection
import hashlib
from .models import Customer, Reservation
import login.views
import json

app_name = 'dashboard'

customer = Customer(0)


def index(request):

    customer_id = login.views.customer_id
    with connection.cursor() as cur:

        cur.execute("SELECT * FROM CUSTOMER WHERE customerId = %s", [customer_id])
        result = cur.fetchone()

        if result is None:
            return redirect('home:index')
        else:

            global customer
            customer = Customer(customer_id=customer_id, name=result[1], email=result[2], username=result[3],
                                gender=result[5], street=result[6], zipcode=result[7], city=result[8], country=result[9])
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


def maps(request):

    global customer
    if customer.customer_id == 0:
        return redirect('home:index')

    else:
        with connection.cursor() as cur:

            sql = "SELECT reservationId, date_of_arrival, date_of_departure, hotelId, roomId FROM " \
                  "RESERVATION WHERE customerId = %s ORDER BY date_of_arrival DESC"
            cur.execute(sql, [customer.customer_id])
            rows = cur.fetchall()
            reservation_list = []

            for row in rows:
                reservation = Reservation(reservation_id=row[0], date_of_arrival=row[1],
                                          date_of_departure=row[2], hotel_id=row[3])

                hotel_id = row[3]
                room_id = row[4]

                cur.execute("SELECT name, city, country FROM HOTEL WHERE hotelId = %s", [hotel_id])
                reservation.hotel_name, reservation.city, reservation.country = cur.fetchone()

                cur.execute("SELECT room_type, cost_per_day  FROM ROOM WHERE roomId = %s", [room_id])
                reservation.room_type, reservation.cost = cur.fetchone()
                reservation.cost *= int(reservation.stay)

                cur.execute("SELECT serviceID, quantity FROM RESERVATION_SERVICE WHERE reservationID = %s", [row[0]])
                all_services = cur.fetchall()

                for service in all_services:

                    cur.execute("SELECT service_type, cost FROM SERVICE WHERE serviceId = %s AND hotelId = %s",
                                 [service[0], hotel_id])
                    sr_name, sr_cost = cur.fetchone()
                    reservation.services.append(sr_name)
                    reservation.cost += (sr_cost*service[1])

                reservation_list.append(reservation)

            return render(request, 'dashboard/maps.html', {'customer': customer, 'reservation_list': reservation_list})


def user(request):

    global customer
    if customer.customer_id == 0:
        return redirect('home:index')
    else:
        if request.method == 'POST':

            with connection.cursor() as cur:

                if request.POST.get("submit_personal"):

                    customer_id = customer.customer_id
                    name = request.POST.get("name")
                    email = request.POST.get("email")
                    username = request.POST.get("username")
                    gender = request.POST.get("gender")
                    street = request.POST.get("street")
                    zipcode = request.POST.get("zipcode")
                    city = request.POST.get("city")
                    country = request.POST.get("country")

                    sql = "UPDATE CUSTOMER SET name = %s, email = %s, username= %s, gender = %s, street = %s," \
                          "zipcode = %s, city = %s, country = %s WHERE customerId = %s"
                    cur.execute(sql, [name, email, username, gender, street, zipcode, city, country, customer_id])
                    connection.commit()

                    customer = Customer(customer_id=customer_id, name=name, email=email, username=username,
                                        gender=gender, street=street, zipcode=zipcode, city=city,
                                        country=country)

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

                        return render(request, 'dashboard/user.html', {'customer': customer,
                                                                       'password_updated': True})

        return render(request, 'dashboard/user.html', {'customer': customer})


