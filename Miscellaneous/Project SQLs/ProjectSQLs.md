# **Login**

`user_login`
```python
v1 = request.POST.get('username')
v2 = request.POST.get('password')
v2 = hashlib.md5(v2.encode()).hexdigest()

with connection.cursor() as cur:

    customer = cur.callfunc('LOGIN_CUSTOMER', int, [v1, v2])
```

`admin_login`
```python
v1 = request.POST.get('username')
v2 = request.POST.get('password')
v2 = hashlib.md5(v2.encode()).hexdigest()

with connection.cursor() as cur:

    admin = cur.callfunc('LOGIN_HOTEL', int, [v1, v2])

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

    customer_id = cur.callfunc('REGISTER', int, [v1, v2, v3, v4, v5, v6, v7, v8, v9, v10])
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
            room_id = cur.var(int).var

            cur.callproc('ADD_NEW_ROOM', [hotel.hotelId, room_type, floor_number, room_id])

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

          

        elif request.POST.get("submit_new_room_type"):

            room_type = request.POST.get('room_type')
            bed_type = request.POST.get('bed_type')
            cost = request.POST.get('cost_per_day')
            discount = request.POST.get('discount')

            exists = cur.var(int).var
            cur.callproc("ADD_NEW_ROOM_TYPE", [room_type, hotel.hotelId, bed_type,
                                                   cost, discount, exists])

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
            exists = cur.var(int).var
            cur.callproc('ADD_NEW_FREE_SERVICE', [hotel.hotelId, new_facility, exists])

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
            exists = cur.var(int).var
            cur.callproc("ADD_NEW_PAID_SERVICE", [service_type, service_subtype, cost, hotel.hotelId, exists])

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

# **PL SQLS** 

`ADD_NEW_FREE_SERVICE`
```sql
CREATE OR REPLACE PROCEDURE "ADD_NEW_FREE_SERVICE"(HID IN NUMBER, FAC IN VARCHAR2,EXISTING OUT NUMBER) AS
	
BEGIN
	SELECT COUNT(*) INTO EXISTING FROM HOTEL_FACILITY WHERE HOTELID = HID AND FACILITIES = INITCAP(FAC);
	IF EXISTING = 0 THEN
		INSERT INTO HOTEL_FACILITY VALUES(HID, INITCAP(FAC));
	END IF;
END;
```

`ADD_NEW_PAID_SERVICE`
```sql
CREATE OR REPLACE PROCEDURE "ADD_NEW_PAID_SERVICE"(S_TYPE IN VARCHAR2, S_SUBTYPE IN VARCHAR2,
COST IN NUMBER, HID IN NUMBER, EXISTING OUT NUMBER) 
AS
	SID NUMBER;
BEGIN
	SELECT SERVICEID INTO EXISTING FROM SERVICE WHERE HOTELID = HID AND SERVICE_TYPE = INITCAP(S_TYPE) AND 
	SERVICE_SUBTYPE = INITCAP(S_SUBTYPE);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		EXISTING := 0;
		SID := GENERATE_ID('SERVICE', 'SERVICEID');
		INSERT INTO SERVICE VALUES(SID, INITCAP(S_TYPE), INITCAP(S_SUBTYPE), COST, HID);
END;
```

`ADD_NEW_ROOM`
```sql
CREATE OR REPLACE PROCEDURE "ADD_NEW_ROOM"(HID IN NUMBER, RT_NAME IN VARCHAR2, FL_NUM IN NUMBER, RID OUT NUMBER) 
AS 
	RTID NUMBER;
BEGIN
	SELECT ROOMTYPEID INTO RTID FROM ROOM_TYPE WHERE HOTELID = HID AND ROOMTYPE_NAME = RT_NAME;
	RID := GENERATE_ID('ROOM', 'ROOMID');
	INSERT INTO ROOM(ROOMID, FLOOR_NUMBER, HOTELID, ROOMTYPEID) VALUES(RID, FL_NUM, HID, RTID);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RID := 0;
		DBMS_OUTPUT.PUT_LINE('NO DATA');
	WHEN OTHERS THEN
		RID := 0;
		DBMS_OUTPUT.PUT_LINE('OTHER ERROR');
END;
```

`ADD_NEW_ROOM_TYPE`
```sql
CREATE OR REPLACE PROCEDURE "ADD_NEW_ROOM_TYPE"(RT IN VARCHAR2, HID IN NUMBER, BT IN VARCHAR2, COST IN NUMBER, DISC IN NUMBER,EXISTING OUT NUMBER) AS
	RTID NUMBER;
BEGIN
	SELECT ROOMTYPEID INTO EXISTING FROM ROOM_TYPE WHERE HOTELID = HID AND UPPER(ROOMTYPE_NAME) = UPPER(RT);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		EXISTING := 0;
		RTID := GENERATE_ID('ROOM_TYPE', 'ROOMTYPEID');
		INSERT INTO ROOM_TYPE(ROOMTYPEID, ROOMTYPE_NAME, BED_TYPE, COST_PER_DAY, DISCOUNT, HOTELID) VALUES(RTID,
		INITCAP(RT), INITCAP(BT), COST, DISC, HID);
END;
```

`GENERATE_ID`
```sql
CREATE OR REPLACE FUNCTION "GENERATE_ID"(TABLE_NAME IN VARCHAR2, COLUMN_NAME IN VARCHAR2) RETURN NUMBER
AS
	ID NUMBER;
	EXISTING NUMBER;
	SQ VARCHAR2(100);
BEGIN
	LOOP 
		ID := ROUND(10000000 + DBMS_RANDOM.VALUE() * (99999999-10000000));
		SQ := 'SELECT COUNT(*) FROM ' || TABLE_NAME || ' WHERE ' || COLUMN_NAME || ' = :1';
		EXECUTE IMMEDIATE SQ INTO EXISTING USING ID;
		EXIT WHEN (EXISTING = 0);
	END LOOP;
	RETURN ID;
END;
```

`LOGIN_CUSTOMER`
```sql
CREATE OR REPLACE FUNCTION "LOGIN_CUSTOMER"(UNAME IN VARCHAR2, PASS IN VARCHAR2) RETURN INT -- VARCHAR2
AS
	CID NUMBER;
BEGIN
	SELECT CUSTOMERID INTO CID FROM CUSTOMER WHERE USERNAME = UNAME AND PASSWORD = PASS AND ISVERIFIED = 'YES';
	RETURN CID;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RETURN 0;
END;
```

`LOGIN_HOTEL`
```sql
CREATE OR REPLACE FUNCTION "LOGIN_HOTEL"(HID IN VARCHAR2, PASS IN VARCHAR2) RETURN NUMBER
AS
	RES NUMBER;
BEGIN
	SELECT HOTELID INTO RES FROM HOTEL WHERE HOTELID = HID AND PASSWORD = PASS;
	RETURN RES;
EXCEPTION 
	WHEN NO_DATA_FOUND THEN 
		RETURN 0;
	WHEN OTHERS THEN
		RETURN 0;
END;
```

`RATING_TRIGGER`
```sql
CREATE TRIGGER "INNOCITY"."RATING_TRIGGER" AFTER UPDATE OF "RATING" ON "INNOCITY"."RESERVATION" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
	HOTEL_RATING NUMBER;
	RATING_COUNT NUMBER;
BEGIN
	SELECT RATING, RATINGCOUNT INTO HOTEL_RATING, RATING_COUNT FROM HOTEL WHERE HOTELID = :OLD.HOTELID;
  IF :OLD.RATING IS NULL THEN
		
		HOTEL_RATING := (HOTEL_RATING * RATING_COUNT + :NEW.RATING)/(RATING_COUNT + 1);
		RATING_COUNT := RATING_COUNT + 1;
		
	ELSE 
		HOTEL_RATING := (HOTEL_RATING * RATING_COUNT - :OLD.RATING + :NEW.RATING )/RATING_COUNT;
		
	END IF;
	UPDATE HOTEL SET RATING = HOTEL_RATING, RATINGCOUNT = RATING_COUNT WHERE HOTELID = :OLD.HOTELID;
END;
```

`REGISTER`
```sql
CREATE OR REPLACE FUNCTION "REGISTER"(C_NAME IN VARCHAR2, C_EMAIL IN VARCHAR2, C_UNAME IN VARCHAR2, C_PASSWORD IN VARCHAR2,C_GENDER IN VARCHAR2, C_STREET IN VARCHAR2, C_ZIPCODE IN VARCHAR2, C_CITY IN VARCHAR2, C_COUNTRY IN VARCHAR2,
C_PHONE IN VARCHAR2)
RETURN NUMBER
AS
	CID NUMBER;
	EXISTING NUMBER;
BEGIN
	SELECT COUNT(*) INTO EXISTING FROM CUSTOMER WHERE USERNAME = C_UNAME;
	IF EXISTING > 0 THEN 
		CID := 0;
	ELSE 
		CID := GENERATE_ID('CUSTOMER', 'CUSTOMERID');
		INSERT INTO CUSTOMER VALUES(CID, C_NAME, C_EMAIL, C_UNAME, C_PASSWORD, C_GENDER, C_STREET, C_ZIPCODE,
		C_CITY, C_COUNTRY, C_PHONE, 'NO');
	END IF;
	RETURN CID;
END;
```
