from django.shortcuts import render
from django.shortcuts import redirect
import cx_Oracle
import hashlib

app_name = 'login'
customer_id = 0


def index(request):

    global customer_id
    customer_id = 0
    if request.method == 'POST':
        print(request.POST.get('username'))
        print(request.POST.get('password'))
        return login(request)
    else:
        return render(request, 'login/index.html', {'alert_flag': False})


def login(request):

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

        print("Login successful. Customer id", customer_id, " Name:", v1)

        return redirect('home:index')