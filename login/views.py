from django.shortcuts import render
import cx_Oracle
# Create your views here.

from django.http import HttpResponse
from django.template import loader

def index(request):
    print(request.method)
    if request.method == 'POST':
        print(request.POST.get('username'))
        print(request.POST.get('password'))
        return login(request)
    else:
        return render(request, 'login/index.html', {'alert_flag': False})

def login(request):
    v1 = request.POST.get('username')
    v2 = request.POST.get('password')

    dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
    conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
    cur = conn.cursor()
    print(cur)
    print('Success')

    sql_auth = "SELECT * FROM CUSTOMER WHERE USERNAME = :vv1 and PASSWORD = :vv2"
    cur.execute(sql_auth,[v1,v2])

    hoise = cur.fetchone()

    if hoise is None:
        print("LOGIN HOENAYYYYYYYY")
        return render(request, 'login/index.html', {'alert_flag': True})
    else:
        print("LOGIN  HOISEEEEEEEEEEE")
        return render(request, 'login/index.html', {'alert_flag': False})
