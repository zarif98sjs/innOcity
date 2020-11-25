# **Login**

`user_login`
```python
v1 = request.POST.get('username')
v2 = request.POST.get('password')
v2 = hashlib.md5(v2.encode()).hexdigest()

with connection.cursor() as cur:

    sql_auth = "SELECT customerId FROM CUSTOMER WHERE USERNAME = %s and PASSWORD = %s"
    cur.execute(sql_auth, [v1, v2])
```

`admin_login`
```python
v1 = request.POST.get('username')
v2 = request.POST.get('password')
v2 = hashlib.md5(v2.encode()).hexdigest()

with connection.cursor() as cur:

    sql_auth = "SELECT HOTELID FROM HOTEL WHERE HOTELID = %s AND PASSWORD = %s"
    cur.execute(sql_auth, [v1, v2])

    hotel = cur.fetchone()
```

# **Register**

`sign_up`
```python
v1 = request.POST.get('name')
v2 = request.POST.get('email')
v3 = request.POST.get('username')
v4 = request.POST.get('password')
v4 = hashlib.md5(v4.encode()).hexdigest()
v5 = request.POST.get('gender')
v6 = request.POST.get('street')
v7 = request.POST.get('zipcode')
v8 = request.POST.get('city')
v9 = request.POST.get('country')

with connection.cursor() as cur:

    sql_find = "SELECT COUNT(*) FROM CUSTOMER WHERE username = %s"
    cur.execute(sql_find, [v3])

    sql = "SELECT CUSTOMERID FROM CUSTOMER"
    cur.execute(sql)
    result = cur.fetchall()

    sql_add_user = "INSERT INTO CUSTOMER (customerId, name, email, username, password, " \
                    "gender, street, zipcode, city, country) " \
                    "VALUES ( %s, %s, %s , %s , %s , %s , %s , %s , %s , %s )"

    cur.execute(sql_add_user, [v0, v1, v2, v3, v4, v5, v6, v7, v8, v9])
    connection.commit()
```

# **Home**

`get_destination`
```python
with connection.cursor() as cur:
    cur.execute("SELECT city,country FROM HOTEL")
    result = cur.fetchall()
```

`best_rated`
```python
with connection.cursor() as cur:

    sql = "SELECT * FROM " \
            "(SELECT * FROM HOTEL ORDER BY RATING DESC) " \
            "WHERE ROWNUM <= 6"
    cur.execute(sql)
    result = cur.fetchall()
```

`top_discount`
```python
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
```

# **Hotel**

`available`
```python

destination = request.POST.get('destination').upper()
room_no = request.POST.get('rooms')
checkin_input = request.POST.get('checkin')
checkout_input = request.POST.get('checkout')

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
```

`payment`
```python
with connection.cursor() as cur:
    cur.execute("SELECT * FROM CUSTOMER WHERE customerId = %s", [customer_id])
    result = cur.fetchone()
```

```python
with connection.cursor() as cur:
    sql = "SELECT ROOMTYPE_NAME , COST_PER_DAY , DISCOUNT FROM ROOM_TYPE WHERE hotelId= %s"
    cur.execute(sql, [hotel_id])
    result = cur.fetchall()
```

`get_context`
```python
with connection.cursor() as cur:
    sql = "SELECT * FROM HOTEL WHERE hotelId= %s"
    cur.execute(sql, [hotel_id])
    result = cur.fetchone()
```

`get_facilities`
```python
with connection.cursor() as cur:
    sql = "SELECT facilities FROM HOTEL_FACILITY WHERE hotelId= %s"
    cur.execute(sql, [hotel_id])
    result = cur.fetchall()
```

`get_services`
```python
with connection.cursor() as cur:
    sql = "SELECT * FROM SERVICE WHERE hotelId= %s"
    cur.execute(sql, [hotel_id])
    result = cur.fetchall()
```

`get_rooms`
```python
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
```

`get_room_facilities`
```python
with connection.cursor() as cur:
    sql = "SELECT facilities FROM ROOM_FACILITY WHERE roomId= %s"
    cur.execute(sql, [room_id])
    result = cur.fetchall()
```

# **Dashboard**

`get_customer`
```python
with connection.cursor() as cur:
    cur.execute("SELECT * FROM CUSTOMER WHERE customerId = %s", [customer_id])
    result = cur.fetchone()
```

`index`
```python
with connection.cursor() as cur2:

    sql = "SELECT H.name, H.city, H.country FROM HOTEL H, RESERVATION R WHERE R.customerId = %s " \
            "AND H.hotelId = R.hotelId"
    cur2.execute(sql, [customer.customer_id])
    rows = cur2.fetchall()
```

`wallet`
```python
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
```

`maps`
```python
with connection.cursor() as cur:

    sql = "SELECT RS.RESERVATIONID, RS.DATE_OF_ARRIVAL, RS.DATE_OF_DEPARTURE, RS.RESERVATION_CHARGE, " \
            "H.HOTELID, H.NAME, H.CITY, H.COUNTRY, RT.ROOMTYPE_NAME, RT.BED_TYPE " \
            "FROM RESERVATION RS, HOTEL H, ROOM RM, ROOM_TYPE RT " \
            "WHERE RS.CUSTOMERID = %s AND RS.HOTELID = H.HOTELID AND RM.ROOMID = RS.ROOMID " \
            "AND RM.ROOMTYPEID = RT.ROOMTYPEID " \
            "ORDER BY RS.DATE_OF_ARRIVAL DESC"

    cur.execute(sql, [customer.customer_id])
    result = cur.fetchall()
```

```python
for row in result:
    reservation = Reservation(reservation_id=row[0], date_of_arrival=row[1],
                                date_of_departure=row[2], reservation_charge=row[3],
                                hotelId=row[4], hotel_name=row[5], city=row[6],
                                country=row[7], room_type=row[8], bed_type=row[9])

    sql = "SELECT S.SERVICE_TYPE, S.COST, RS.QUANTITY " \
            "FROM SERVICE S, RESERVATION_SERVICE RS " \
            "WHERE S.SERVICEID = RS.SERVICEID AND RS.RESERVATIONID = %s"
    cur.execute(sql, [row[0]])
    all_services = cur.fetchall()
```

`user`
```python
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
        connection.commit()

        customer = Customer(customer_id=customer_id, name=name, email=email, username=username,
                            phone=phone, street=street, zipcode=zipcode, city=city,
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

```

# **Hotel Admin** 

`index`
```python
with connection.cursor() as cur:

    if request.method == 'POST':

        if request.POST.get("submit_cost"):

            room_type = request.POST.get("room_type")
            bed_type = request.POST.get("bed_type")
            cost_per_day = request.POST.get("cost_per_day")
            discount = request.POST.get("discount")

            sql = "UPDATE ROOM_TYPE SET COST_PER_DAY = %s, DISCOUNT = %s " \
                    "WHERE HOTELID = %s AND ROOMTYPE_NAME = %s AND BED_TYPE = %s"
            cur.execute(sql, [cost_per_day, discount, hotel.hotelId, room_type, bed_type])
            connection.commit()
            messages.add_message(request, messages.INFO, "Room Cost Updated")

        elif request.POST.get("submit_new_room"):

            room_type, _ = request.POST.get("room_bed").split(" (")
            floor_number = request.POST.get("floor_number")
            room_id = generate_new_id("SELECT ROOMID FROM ROOM")

            sql = "SELECT ROOMTYPEID FROM ROOM_TYPE WHERE HOTELID = %s AND ROOMTYPE_NAME = %s"
            cur.execute(sql, [hotel.hotelId, room_type])
            roomtype_id = cur.fetchone()[0]

            sql = "INSERT INTO ROOM(ROOMID, FLOOR_NUMBER, HOTELID, ROOMTYPEID) " \
                    "VALUES(%s, %s, %s, %s)"
            cur.execute(sql, [room_id, floor_number, hotel.hotelId, roomtype_id])
            connection.commit()

            i = 1
            while True:
                f = request.POST.get("room_facilities-" + str(i))
                if f is None:
                    break
                if f is not "":
                    sql = "INSERT INTO ROOM_FACILITY VALUES(%s, INITCAP(%s))"
                    cur.execute(sql, [room_id, f])
                    connection.commit()
                i = i + 1

            messages.add_message(request, messages.INFO, "New Room Enlisted")

        elif request.POST.get("submit_new_room_type"):

            room_type = request.POST.get('room_type')
            bed_type = request.POST.get('bed_type')
            cost = request.POST.get('cost_per_day')
            discount = request.POST.get('discount')

            sql = "SELECT * FROM ROOM_TYPE WHERE HOTELID = %s AND UPPER(ROOMTYPE_NAME) = UPPER(%s) "
            cur.execute(sql, [hotel.hotelId, room_type])
            row = cur.fetchone()

            if row is None:
                roomtype_id = generate_new_id("SELECT ROOMTYPEID FROM ROOM_TYPE")
                sql = "INSERT INTO ROOM_TYPE VALUES(%s, INITCAP(%s), INITCAP(%s), %s, %s, %s)"
                cur.execute(sql, [roomtype_id, room_type, bed_type, cost, discount, hotel.hotelId])
                messages.add_message(request, messages.INFO, "New Room Type Enlisted")
            else:
                messages.add_message(request, messages.INFO, "This Type Already Exists")
```

`get_room_list`
```python
with connection.cursor() as cur:
    sql = "SELECT RT.ROOMTYPE_NAME, RT.BED_TYPE, RT.COST_PER_DAY, RT.DISCOUNT, " \
            "(SELECT COUNT(*) FROM ROOM R WHERE R.ROOMTYPEID = RT.ROOMTYPEID) " \
            "FROM ROOM_TYPE RT " \
            "WHERE RT.HOTELID = %s"

    cur.execute(sql, [hotel_id])
    rooms = cur.fetchall()
```

`get_hotel`
```python
with connection.cursor() as cur:

    sql = "SELECT * FROM HOTEL WHERE HOTELID = %s"
    cur.execute(sql, [hotel_id])
    row = cur.fetchone()
```

`service`
```python
with connection.cursor() as cur:

    if request.method == "POST":

        if request.POST.get("submit_new_facility"):

            new_facility = request.POST.get("facility")
            sql = "INSERT INTO HOTEL_FACILITY VALUES(%s, INITCAP(%s))"
            cur.execute(sql, [hotel.hotelId, new_facility])
            connection.commit()
            return HttpResponseRedirect(reverse('hotel_admin:service'))

        elif request.POST.get("submit_delete_facility"):

            delete_facility = request.POST.get("delete_list")
            sql = "DELETE HOTEL_FACILITY WHERE HOTELID = %s AND LOWER(FACILITIES) = LOWER(%s)"
            cur.execute(sql, [hotel.hotelId, delete_facility])

        elif request.POST.get("submit_cost"):

            service_id = request.POST.get("service_id")
            cost = request.POST.get("cost")
            sql = "UPDATE SERVICE SET COST = %s WHERE SERVICEID = %s"
            cur.execute(sql, [cost, service_id])
            connection.commit()

        elif request.POST.get("submit_new_service_under_service_type"):

            service_type = request.POST.get("service_type")
            service_subtype = request.POST.get("service_subtype")
            cost = request.POST.get("cost")
            service_id = generate_new_id("SELECT SERVICEID FROM SERVICE")
            sql = "INSERT INTO SERVICE VALUES(%s, %s, INITCAP(%s), %s, %s)"
            cur.execute(sql, [service_id, service_type, service_subtype, cost, hotel.hotelId])
            connection.commit()

        return HttpResponseRedirect(reverse('hotel_admin:service'))

    sql = "SELECT DISTINCT FACILITIES FROM HOTEL_FACILITY WHERE HOTELID = %s"
    cur.execute(sql, [hotel.hotelId])
    result = cur.fetchall()
    hotel_facilities = [row[0] for row in result]

    sql = "SELECT SERVICEID, SERVICE_TYPE, SERVICE_SUBTYPE, COST FROM SERVICE WHERE HOTELID = %s"
    cur.execute(sql, [hotel.hotelId])
    result = cur.fetchall()
```

`reservation`
```python
with connection.cursor() as cur:

    sql = "SELECT RS.DATE_OF_ARRIVAL, RS.DATE_OF_DEPARTURE, RS.RESERVATION_CHARGE, C.NAME, R.ROOMID, " \
            "R.FLOOR_NUMBER, RT.ROOMTYPE_NAME, RT.BED_TYPE, " \
            "(SELECT NVL(SUM(RSS.QUANTITY * S.COST),0) FROM RESERVATION_SERVICE RSS, SERVICE S " \
            "WHERE RSS.RESERVATIONID = RS.RESERVATIONID AND RSS.SERVICEID = S.SERVICEID) AS SERVICE_CHARGE " \
            "FROM RESERVATION RS, CUSTOMER C, ROOM R, ROOM_TYPE RT WHERE RS.HOTELID = %s AND " \
            "RS.CUSTOMERID = C.CUSTOMERID AND RS.ROOMID = R.ROOMID AND R.ROOMTYPEID = RT.ROOMTYPEID "
    list_vars = [hotel.hotelId]

    if request.method == "POST" and request.POST.get("search"):

        if request.POST.get("month"):
            sql += "AND EXTRACT(MONTH FROM RS.DATE_OF_ARRIVAL) = %s "
            list_vars.append(request.POST.get("month"))

        if request.POST.get("year"):
            sql += "AND EXTRACT(YEAR FROM RS.DATE_OF_ARRIVAL) = %s "
            list_vars.append(request.POST.get("year"))

        if request.POST.get("room_bed") != "all rooms":
            room_type, bed_type = request.POST.get("room_bed").split(" (")
            sql += "AND RT.ROOMTYPE_NAME = %s "
            list_vars.append(room_type)

    sql += "ORDER BY R.ROOMID ASC, RS.DATE_OF_ARRIVAL DESC"

    cur.execute(sql, list_vars)
    result = cur.fetchall()

```