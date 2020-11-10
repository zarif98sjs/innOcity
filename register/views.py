from django.shortcuts import render, redirect
from django.db import connection
import hashlib
from random import randint


from django.http import HttpResponse

app_name = 'register'


def index(request):

    if request.method == 'POST':
        return sign_up(request)
    else:
        return render(request, 'register/index.html', {'alert_flag': False})


def sign_up(request):

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

    if v1 == "":
        print("No name")
    elif v2 == "":
        print("No email")
    elif v3 == "":
        print("No username")
    elif v4 == "":
        print("No password")
    elif v5 == "":
        print("No gender")
    elif v6 == "":
        print("No street")
    elif v7 == "":
        print("No zipcode")
    elif v8 == "":
        print("No city")
    elif v9 == "":
        print("No country")
    else:

        with connection.cursor() as cur:

            sql_find = "SELECT COUNT(*) FROM CUSTOMER WHERE username = %s"
            cur.execute(sql_find, [v3])
            if cur.fetchone()[0] > 0:
                return render(request, 'register/index.html', {'invalid_username': True})

            sql = "SELECT CUSTOMERID FROM CUSTOMER"
            cur.execute(sql)
            result = cur.fetchall()
            customer_ids = [row[0] for row in result]

            v0 = 0
            while True:
                v0 = randint(10000000, 99999999)
                if v0 not in customer_ids:
                    break

            sql_add_user = "INSERT INTO CUSTOMER (customerId, name, email, username, password, " \
                           "gender, street, zipcode, city, country) " \
                           "VALUES ( %s, %s, %s , %s , %s , %s , %s , %s , %s , %s )"

            cur.execute(sql_add_user, [v0, v1, v2, v3, v4, v5, v6, v7, v8, v9])
            connection.commit()

            return redirect('login:index')

    return render(request, 'register/index.html', {'alert_flag': True})



