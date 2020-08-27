from django.shortcuts import render, redirect
import cx_Oracle
import hashlib
from .models import Customer, Reservation
import login.views

app_name = 'dashboard'

customer = Customer(0)


def index(request):

    customer_id = login.views.customer_id
    dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
    conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
    cur = conn.cursor()

    cur.execute("SELECT * FROM CUSTOMER WHERE customerId = :cid", [customer_id])
    result = cur.fetchone()

    if result is None:
        cur.close()
        conn.close()
        return redirect('home:index')
    else:

        global customer
        customer = Customer(customer_id=customer_id, name=result[1], email=result[2], username=result[3],
                            gender=result[5], street=result[6], zipcode=result[7], city=result[8], country=result[9])
        print(customer_id, customer.name, customer.email, customer.username, customer.gender, customer.street, customer.zipcode, customer.city, customer.country)
        cur.close()
        conn.close()
        return render(request, 'dashboard/index.html', {'customer': customer})


def maps(request):

    global customer
    if customer.customer_id == 0:
        return redirect('home:index')

    else:

        dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
        conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
        cur = conn.cursor()
        cur2 = conn.cursor()
        cur3 = conn.cursor()

        sql = "SELECT reservationId, date_of_arrival, date_of_departure, hotelId, roomId FROM " \
              "RESERVATION WHERE customerId = :cid ORDER BY date_of_arrival DESC"
        cur.execute(sql, [customer.customer_id])
        rows = cur.fetchall()
        reservation_list = []

        for row in rows:
            reservation = Reservation(reservation_id=row[0], date_of_arrival=row[1],
                                      date_of_departure=row[2], hotel_id=row[3])

            hotel_id = row[3]
            room_id = row[4]

            cur2.execute("SELECT name, city, country FROM HOTEL WHERE hotelId = :hid", [hotel_id])
            reservation.hotel_name, reservation.city, reservation.country = cur2.fetchone()

            cur2.execute("SELECT room_type, cost_per_day  FROM ROOM WHERE roomId = :rid", [room_id])
            reservation.room_type, reservation.cost = cur2.fetchone()
            reservation.cost *= int(reservation.stay)

            cur2.execute("SELECT serviceID, quantity FROM RESERVATION_SERVICE WHERE reservationID = :rsid", [row[0]])
            all_services = cur2.fetchall()

            for service in all_services:

                cur3.execute("SELECT service_type, cost FROM SERVICE WHERE serviceId = :srid AND hotelId = :hid",
                             [service[0], hotel_id])
                sr_name, sr_cost = cur3.fetchone()
                reservation.services.append(sr_name)
                reservation.cost += (sr_cost*service[1])

            reservation_list.append(reservation)

        cur3.close()
        cur2.close()
        cur.close()
        conn.close()
        return render(request, 'dashboard/maps.html', {'customer': customer, 'reservation_list': reservation_list})


def user(request):

    global customer
    if customer.customer_id == 0:
        return redirect('home:index')
    else:
        if request.method == 'POST':

            dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
            conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
            cur = conn.cursor()

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

                sql = "UPDATE CUSTOMER SET name = :v1, email = :v2, username= :v3, gender = :v4, street = :v5," \
                      "zipcode = :v6, city = :v7, country = :v8 WHERE customerId = :v9"
                cur.execute(sql, [name, email, username, gender, street, zipcode, city, country, customer_id])
                conn.commit()

                customer = Customer(customer_id=customer_id, name=name, email=email, username=username,
                                    gender=gender, street=street, zipcode=zipcode, city=city,
                                    country=country)

            elif request.POST.get("submit_password"):

                cur.execute("SELECT password FROM CUSTOMER WHERE customerId = :id", [customer.customer_id])
                old_pass_hash = cur.fetchone()[0]
                input_old_pass = request.POST.get("old_password")
                input_old_pass_hash = hashlib.md5(input_old_pass.encode()).hexdigest()

                if input_old_pass_hash != old_pass_hash:
                    return render(request, 'dashboard/user.html', {'customer': customer,
                                                                   'wrong_password': True})
                else:
                    cur2 = conn.cursor()
                    input_new_pass = request.POST.get("new_password")
                    input_new_pass_hash = hashlib.md5(input_new_pass.encode()).hexdigest()
                    sql = "UPDATE CUSTOMER SET password = :v1 WHERE customerId = :v2"
                    cur2.execute(sql, [input_new_pass_hash, customer.customer_id])
                    conn.commit()
                    cur2.close()
                    return render(request, 'dashboard/user.html', {'customer': customer,
                                                                   'password_updated': True})

            cur.close()
            conn.close()
        return render(request, 'dashboard/user.html', {'customer': customer})


