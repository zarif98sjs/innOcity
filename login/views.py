from django.shortcuts import render
from django.shortcuts import redirect
from django.db import connection
from random import randint
import hashlib

app_name = 'login'
customer_id = 0


def index(request):

    global customer_id
    customer_id = 0

    '''call the commented out functions only once'''
    # customer_id_change()
    # hotel_id_change()
    # room_id_change()

    if request.method == 'POST':
        return login(request)
    else:
        return render(request, 'login/index.html', {'alert_flag': False})


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


def login(request):

    global customer_id
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
            print("Login successful. Customer id", customer_id, " Name:", v1)
            return redirect('home:index')