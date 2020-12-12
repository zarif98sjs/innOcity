from django.shortcuts import render
from django.shortcuts import redirect
from django.db import connection
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse
import hashlib

app_name = 'login'


def index(request):

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


