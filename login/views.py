from django.shortcuts import render
from django.shortcuts import redirect
from django.db import connection
import hashlib

app_name = 'login'
customer_id = 0
admin_id = 0


def index(request):

    if request.method == 'POST':
        if request.POST.get('login_type') == 'Log in as User':
            return user_login(request)
        else:
            return admin_login(request)
    else:
        try:
            del request.session['customer_id']
        except:
            pass
        return render(request, 'login/index.html', {'alert_flag': False})


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
            request.session['customer_id'] = customer_id
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
            request.session['admin_id'] = admin_id
            return redirect('hotel_admin:index')

