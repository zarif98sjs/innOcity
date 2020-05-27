from django.shortcuts import render
import cx_Oracle
import hashlib
# Create your views here.

from django.http import HttpResponse
from django.template import loader

app_name = 'login'
customer_id = 0
customer_name = ""


def index(request):

    if request.method == 'POST':
        print(request.POST.get('username'))
        print(request.POST.get('password'))
        return login(request)
    else:
        return render(request, 'login/index.html', {'alert_flag': False})


def login(request):

    global customer_name
    global customer_id

    v1 = request.POST.get('username')
    v2 = request.POST.get('password')
    v2 = hashlib.md5(v2.encode()).hexdigest()

    dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
    conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
    cur = conn.cursor()


    sql_auth = "SELECT customerId FROM CUSTOMER WHERE USERNAME = :vv1 and PASSWORD = :vv2"
    cur.execute(sql_auth, [v1, v2])

    customer = cur.fetchone()

    if customer is None:
        return render(request, 'login/index.html', {'alert_flag': True})
    else:
        customer_id = customer[0]
        customer_name = v1
        print("Login successful. Customer id", customer_id, " Name:", customer_name)
        return render(request, 'login/index.html', {'alert_flag': False})
