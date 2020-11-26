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


            customer = Customer(customer_id=v0, name=v1 , isVerified='NO')

            print("Before activation , customer id : ", customer.customer_id)

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
            # return redirect(request, 'login/index.html', {'verification_box': True , 'msg_head':"Verification" , 'msg_body' : 'Please check your e-mail and verify your account'})
            # return redirect('login:index')

    return render(request, 'register/index.html', {'alert_flag': True})


def activate(request, uidb64, token):
    try:
        id = force_text(urlsafe_base64_decode(uidb64))
        print("After activation , customer id : ",id)

        with connection.cursor() as cur:
            cur.execute("SELECT NAME , ISVERIFIED FROM CUSTOMER WHERE customerId = %s", [id])
            result = cur.fetchone()

            if result is None:
                print("None")
                messages.success(request, "You have not created any account")
                return redirect('login:index')
                # return render(request , 'login/index.html', {'verification_box': True, 'msg_head': "Verification", 'msg_body': 'You have not created any account'})
            else:
                customer = Customer(customer_id=id, name=result[0], isVerified=result[1])
                if not account_activation_token.check_token(customer, token):
                    print('User already activated')
                    messages.success(request, "Your account is already activated")
                    return redirect('login:index')
                    # return render(request, 'login/index.html', {'verification_box': True , 'msg_head':"Verification", 'msg_body': 'Your account is already activated'})

                cur.execute("UPDATE CUSTOMER SET ISVERIFIED = 'YES' WHERE customerId = %s", [id])

                print("Account Activated Successfully")
                messages.success(request, "Account Activated Successfully")
                return redirect('login:index')
                # return render(request, 'login/index.html', {'verification_box': True , 'msg_head':"Verification", 'msg_body': 'Account Activated Successfully'})

    except Exception as ex:
        print(ex)
        pass

    return redirect('login:index')
