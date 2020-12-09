from django.shortcuts import render
from django.shortcuts import redirect
from django.db import connection
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse
import hashlib
import random
from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from easy_pdf.rendering import render_to_pdf
from django.core.mail import EmailMessage

app_name = 'login'


def index(request):

    random_ratings()

    if request.method == 'POST':
        if request.POST.get('login_type') == 'Log in as User':
            return user_login(request)
        else:
            return admin_login(request)
    else:
        try:
            del request.session['customer_id']
            del request.session['admin_id']
        except:
            pass
        return render(request, 'login/index.html', {'alert_flag': False})


def random_ratings():
    hotelid = 49833330
    with connection.cursor() as cur:
        cur.execute("SELECT RESERVATIONID FROM RESERVATION WHERE HOTELID = 49833330 ORDER BY RESERVATION_CHARGE DESC")
        rs = cur.fetchall()
        all_rs = [r[0] for r in rs]

        cur.execute("SELECT SERVICEID FROM SERVICE WHERE HOTELID = 49833330")
        rs = cur.fetchall()
        all_s = [r[0] for r in rs]

        for i in range(400, 750):
            count = 1
            for j in range(count):
                ss = random.choice(all_s)
                qq = random.randint(1, 2)
                cur.execute("INSERT INTO RESERVATION_SERVICE VALUES(%s, %s, %s)", [all_rs[i], ss, qq])
                connection.commit()



def user_login(request):

    v1 = request.POST.get('username')
    v2 = request.POST.get('password')
    v2 = hashlib.md5(v2.encode()).hexdigest()

    with connection.cursor() as cur:

        customer = cur.callfunc('LOGIN_CUSTOMER', int, [v1, v2])

        if customer == 0:
            messages.success(request, "Wrong username or password")
            return HttpResponseRedirect(reverse('login:index'))
        else:
            request.session['customer_id'] = customer
            return redirect('home:index')


def admin_login(request):

    v1 = request.POST.get('username')
    v2 = request.POST.get('password')
    v2 = hashlib.md5(v2.encode()).hexdigest()

    with connection.cursor() as cur:

        admin = cur.callfunc('LOGIN_HOTEL', int, [v1, v2])

        if admin == 0:
            messages.success(request, "Wrong username or password")
            return HttpResponseRedirect(reverse('login:index'))
        else:

            request.session['admin_id'] = admin
            return redirect('hotel_admin:index')


