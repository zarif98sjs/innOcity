from django.shortcuts import render, redirect
from django.db import connection
import hashlib
from random import randint


from django.http import HttpResponse

app_name = 'register'

from django.conf import settings
from django.contrib import messages
from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes, force_text
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.urls import reverse
from dashboard.models import Customer

from .utils import account_activation_token


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
    v10 = request.POST.get('phone')

    with connection.cursor() as cur:

        customer_id = cur.callfunc('REGISTER', int, [v1, v2, v3, v4, v5, v6, v7, v8, v9, v10])

        if customer_id == 0:
            return render(request, 'register/index.html', {'invalid_username': True})

        customer = Customer(customer_id=customer_id, name=v1, isVerified='NO')

        current_site = get_current_site(request)

        email_body = {
            'user': customer.name,
            'domain': current_site.domain,
            'uid': urlsafe_base64_encode(force_bytes(customer.customer_id)),
            'token': account_activation_token.make_token(customer),
        }

        link = reverse('register:activate', kwargs={
            'uidb64': email_body['uid'], 'token': email_body['token']})

        activate_url = 'http://' + current_site.domain + link

        email_subject = "Activate your innOcity Account"
        email_body = 'Hi '+v1 + ', Please click the link to activate your account : '+activate_url

        email = EmailMessage(
            email_subject,
            email_body,
            settings.EMAIL_HOST_USER,
            [v2],
        )

        email.fail_silently = False
        email.send()

        messages.success(request, "Please check your e-mail and verify your account")
        return redirect('login:index')


def activate(request, uidb64, token):
    try:
        id = force_text(urlsafe_base64_decode(uidb64))

        with connection.cursor() as cur:
            cur.execute("SELECT NAME , ISVERIFIED FROM CUSTOMER WHERE customerId = %s", [id])
            result = cur.fetchone()

            if result is None:
                messages.success(request, "You have not created any account")
                return redirect('login:index')
            else:
                customer = Customer(customer_id=id, name=result[0], isVerified=result[1])
                if not account_activation_token.check_token(customer, token):
                    messages.success(request, "Your account is already activated")
                    return redirect('login:index')

                cur.execute("UPDATE CUSTOMER SET ISVERIFIED = 'YES' WHERE customerId = %s", [id])

                messages.success(request, "Account Activated Successfully")
                return redirect('login:index')

    except Exception as ex:
        pass

    return redirect('login:index')
