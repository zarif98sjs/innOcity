from django.shortcuts import render
from django.shortcuts import redirect
from django.db import connection
from random import randint, uniform
import hashlib

app_name = 'login'
customer_id = 0
admin_id = 0


def index(request):

    '''call the commented out functions only once'''
    # customer_id_change()
    # hotel_id_change()
    # room_id_change()
    # payment_id_change()
    # service_id_change()
    # reservation_id_change()

    '''add password to hotel table'''
    # set_hotel_pass()

    '''make rating float'''
    # fix_hotel_rating()

    '''set same price for same roomtypes'''
    # fix_room_price()

    '''add room id to reservation'''
    # room_to_reservation()

    if request.method == 'POST':
        if request.POST.get('login_type') == 'Log in as User':
            return user_login(request)
        else:
            return admin_login(request)
    else:
        return render(request, 'login/index.html', {'alert_flag': False})


'''
def customer_id_change():

    with connection.cursor() as cur:
        sql = "SELECT CUSTOMERID FROM CUSTOMER"
        cur.execute(sql)
        res = cur.fetchall()
        current_ids = [row[0] for row in res]
        size = len(current_ids)

        random_ids = set()
        while len(random_ids) < size:
            x = randint(10000000, 99999999)
            random_ids.add(x)

        # dropping the foreign key constraint from table RESERVATION
        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='RESERVATION' " \
              "AND COLUMN_NAME='CUSTOMERID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE RESERVATION DROP CONSTRAINT " + constraint_name
        cur.execute(sql)

        # replacing old customer ids with new ones in both tables
        for current, rand in zip(current_ids, random_ids):
            sql = "UPDATE RESERVATION SET CUSTOMERID = %s WHERE CUSTOMERID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()
            sql = "UPDATE CUSTOMER SET CUSTOMERID = %s WHERE CUSTOMERID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

        # adding the foreign key constraint to table RESERVATION again
        sql = "ALTER TABLE RESERVATION ADD FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID)"
        cur.execute(sql)


def hotel_id_change():

    with connection.cursor() as cur:

        sql = "SELECT HOTELID FROM HOTEL"
        cur.execute(sql)
        result = cur.fetchall()
        current_ids = [row[0] for row in result]
        size = len(current_ids)

        random_ids = set()
        while len(random_ids) < size:
            x = randint(10000000, 99999999)
            random_ids.add(x)

        # dropping foreign key constraints from tables reservation, room, service

        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='RESERVATION' " \
              "AND COLUMN_NAME='HOTELID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE RESERVATION DROP CONSTRAINT " + constraint_name
        cur.execute(sql)

        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='ROOM' " \
              "AND COLUMN_NAME='HOTELID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE ROOM DROP CONSTRAINT " + constraint_name
        cur.execute(sql)

        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='SERVICE' " \
              "AND COLUMN_NAME='HOTELID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE SERVICE DROP CONSTRAINT " + constraint_name
        cur.execute(sql)
        
        # replacing old hotel ids with new ones in all tables
        
        for current, rand in zip(current_ids, random_ids):
            sql = "UPDATE RESERVATION SET HOTELID = %s WHERE HOTELID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

            sql = "UPDATE ROOM SET HOTELID = %s WHERE HOTELID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

            sql = "UPDATE SERVICE SET HOTELID = %s WHERE HOTELID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

            sql = "UPDATE HOTEL SET HOTELID = %s WHERE HOTELID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

            sql = "UPDATE HOTEL_FACILITY SET HOTELID = %s WHERE HOTELID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

        # adding the foreign key constraints again
        sql = "ALTER TABLE RESERVATION ADD FOREIGN KEY(HOTELID) REFERENCES HOTEL(HOTELID)"
        cur.execute(sql)

        sql = "ALTER TABLE ROOM ADD FOREIGN KEY(HOTELID) REFERENCES HOTEL(HOTELID)"
        cur.execute(sql)

        sql = "ALTER TABLE SERVICE ADD FOREIGN KEY(HOTELID) REFERENCES HOTEL(HOTELID)"
        cur.execute(sql)


def room_id_change():

    with connection.cursor() as cur:
        sql = "SELECT ROOMID FROM ROOM"
        cur.execute(sql)
        res = cur.fetchall()
        current_ids = [row[0] for row in res]
        size = len(current_ids)

        random_ids = set()
        while len(random_ids) < size:
            x = randint(10000000, 99999999)
            random_ids.add(x)

        # dropping the foreign key constraint from table RESERVATION
        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='RESERVATION' " \
              "AND COLUMN_NAME='ROOMID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE RESERVATION DROP CONSTRAINT " + constraint_name
        cur.execute(sql)

        # replacing old room ids with new ones in all tables
        for current, rand in zip(current_ids, random_ids):
            sql = "UPDATE RESERVATION SET ROOMID = %s WHERE ROOMID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

            sql = "UPDATE ROOM SET ROOMID = %s WHERE ROOMID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

            sql = "UPDATE ROOM_FACILITY SET ROOMID = %s WHERE ROOMID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

        # adding the foreign key constraint to table RESERVATION again
        sql = "ALTER TABLE RESERVATION ADD FOREIGN KEY(ROOMID) REFERENCES ROOM(ROOMID)"
        cur.execute(sql)


def payment_id_change():

    with connection.cursor() as cur:
        sql = "SELECT PAYMENTID FROM PAYMENT"
        cur.execute(sql)
        res = cur.fetchall()
        current_ids = [row[0] for row in res]
        size = len(current_ids)

        random_ids = set()
        while len(random_ids) < size:
            x = randint(10000000, 99999999)
            random_ids.add(x)

        # dropping the foreign key constraint from table RESERVATION
        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='RESERVATION' " \
              "AND COLUMN_NAME='PAYMENTID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE RESERVATION DROP CONSTRAINT " + constraint_name
        cur.execute(sql)

        # replacing old customer ids with new ones in both tables
        for current, rand in zip(current_ids, random_ids):
            sql = "UPDATE RESERVATION SET PAYMENTID = %s WHERE PAYMENTID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()
            sql = "UPDATE PAYMENT SET PAYMENTID = %s WHERE PAYMENTID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

        # adding the foreign key constraint to table RESERVATION again
        sql = "ALTER TABLE RESERVATION ADD FOREIGN KEY(PAYMENTID) REFERENCES PAYMENT(PAYMENTID)"
        cur.execute(sql)


def service_id_change():

    with connection.cursor() as cur:
        sql = "SELECT SERVICEID FROM SERVICE"
        cur.execute(sql)
        res = cur.fetchall()
        current_ids = [row[0] for row in res]
        size = len(current_ids)

        random_ids = set()
        while len(random_ids) < size:
            x = randint(10000000, 99999999)
            random_ids.add(x)

        # dropping the foreign key constraint from table RESERVATION
        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='RESERVATION_SERVICE' " \
              "AND COLUMN_NAME='SERVICEID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE RESERVATION_SERVICE DROP CONSTRAINT " + constraint_name
        cur.execute(sql)

        # replacing old customer ids with new ones in both tables
        for current, rand in zip(current_ids, random_ids):
            sql = "UPDATE RESERVATION_SERVICE SET SERVICEID = %s WHERE SERVICEID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()
            sql = "UPDATE SERVICE SET SERVICEID = %s WHERE SERVICEID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

        # adding the foreign key constraint to table RESERVATION again
        sql = "ALTER TABLE RESERVATION_SERVICE ADD FOREIGN KEY(SERVICEID) REFERENCES SERVICE(SERVICEID)"
        cur.execute(sql)


def reservation_id_change():

    with connection.cursor() as cur:
        sql = "SELECT RESERVATIONID FROM RESERVATION"
        cur.execute(sql)
        res = cur.fetchall()
        current_ids = [row[0] for row in res]
        size = len(current_ids)

        random_ids = set()
        while len(random_ids) < size:
            x = randint(10000000, 99999999)
            random_ids.add(x)

        # dropping the foreign key constraint from table RESERVATION
        sql = "SELECT CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME='RESERVATION_SERVICE' " \
              "AND COLUMN_NAME='RESERVATIONID'"
        cur.execute(sql)
        constraint_name = cur.fetchone()[0]
        sql = "ALTER TABLE RESERVATION_SERVICE DROP CONSTRAINT " + constraint_name
        cur.execute(sql)

        # replacing old customer ids with new ones in both tables
        for current, rand in zip(current_ids, random_ids):
            sql = "UPDATE RESERVATION_SERVICE SET RESERVATIONID = %s WHERE RESERVATIONID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()
            sql = "UPDATE RESERVATION SET RESERVATIONID = %s WHERE RESERVATIONID = %s"
            cur.execute(sql, [rand, current])
            connection.commit()

        # adding the foreign key constraint to table RESERVATION again
        sql = "ALTER TABLE RESERVATION_SERVICE ADD FOREIGN KEY(RESERVATIONID) REFERENCES RESERVATION(RESERVATIONID)"
        cur.execute(sql)
'''


def room_to_reservation():

    with connection.cursor() as cur:

        sql = "SELECT RESERVATIONID, HOTELID FROM RESERVATION"
        cur.execute(sql)
        result = cur.fetchall()

        for row in result:
            reservation_id = row[0]
            hotel_id = row[1]

            sql = "SELECT ROOMID FROM ROOM WHERE HOTELID = %s"
            cur.execute(sql, [hotel_id])
            rooms = cur.fetchall()
            rand_id = randint(0, len(rooms)-1)
            room_id = rooms[rand_id][0]

            sql = "UPDATE RESERVATION SET ROOMID = %s WHERE RESERVATIONID = %s"
            cur.execute(sql, [room_id, reservation_id])
            connection.commit()


def set_hotel_pass():

    with connection.cursor() as cur:
        sql_alter = "ALTER TABLE HOTEL ADD PASSWORD VARCHAR(50)"
        cur.execute(sql_alter)
        connection.commit()

        sql = "SELECT HOTELID FROM HOTEL"
        cur.execute(sql)
        ids = cur.fetchall()

        for id in ids:
            password = str(randint(1, 10000000))
            password = hashlib.md5(password.encode()).hexdigest()
            sql_update = "UPDATE HOTEL SET PASSWORD = %s WHERE HOTELID = %s"
            cur.execute(sql_update, [password, id[0]])
            connection.commit()


def fix_hotel_rating():

    with connection.cursor() as cur:

        sql = "ALTER TABLE HOTEL MODIFY RATING NUMBER(3,2)"
        cur.execute(sql)

        sql = "SELECT HOTELID FROM HOTEL"
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            hotelid = row[0]
            rating = round(uniform(2.0, 5.0), 2)
            print(rating)
            sql = "UPDATE HOTEL SET RATING = %s WHERE HOTELID = %s"
            cur.execute(sql, [rating, hotelid])
            connection.commit()


def fix_room_price():

    with connection.cursor() as cur:

        sql = "UPDATE ROOM R SET R.COST_PER_DAY = " \
              "(SELECT CEIL(AVG(R2.COST_PER_DAY)) FROM ROOM R2 WHERE R2.HOTELID = R.HOTELID " \
              "AND R2.ROOM_TYPE = R.ROOM_TYPE AND R2.BED_TYPE = R.BED_TYPE), " \
              "R.DISCOUNT = " \
              "(SELECT CEIL(AVG(R3.DISCOUNT)) FROM ROOM R3 WHERE R3.HOTELID = R.HOTELID " \
              "AND R3.ROOM_TYPE = R.ROOM_TYPE AND R3.BED_TYPE = R.BED_TYPE)"

        cur.execute(sql)
        connection.commit()


def user_login(request):

    global customer_id
    customer_id = 0
    v1 = request.POST.get('username')
    v2 = request.POST.get('password')
    v2 = hashlib.md5(v2.encode()).hexdigest()

    with connection.cursor() as cur:

        sql_auth = "SELECT customerId FROM CUSTOMER WHERE USERNAME = %s and PASSWORD = %s"
        cur.execute(sql_auth, [v1, v2])

        customer = cur.fetchone()

        if customer is None:
            return render(request, 'login/index.html', {'alert_flag': True})
        else:
            customer_id = customer[0]
            return redirect('home:index')


def admin_login(request):

    global admin_id
    admin_id = 0

    v1 = request.POST.get('username')
    v2 = request.POST.get('password')
    v2 = hashlib.md5(v2.encode()).hexdigest()

    with connection.cursor() as cur:

        sql_auth = "SELECT HOTELID FROM HOTEL WHERE HOTELID = %s AND PASSWORD = %s"
        cur.execute(sql_auth, [v1, v2])

        hotel = cur.fetchone()

        if hotel is None:
            return render(request, 'login/index.html', {'alert_flag': True})
        else:
            admin_id = hotel[0]
            return redirect('hotel_admin:index')
