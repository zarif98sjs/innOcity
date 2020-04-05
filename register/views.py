from django.shortcuts import render
import cx_Oracle
# Create your views here.

from django.http import HttpResponse
from django.template import loader

def index(request):
    print(request.method)
    if request.method=='POST':
        print(request.POST.get('name'))
        # print(request.POST.get('email'))
        # print(request.POST.get('username'))
        return sign_up(request)
    else:
        return render(request,'register/index.html', {'alert_flag': False})

def sign_up(request):

    v1 = request.POST.get('name')
    v2 = request.POST.get('email')
    v3 = request.POST.get('username')
    v4 = request.POST.get('password')
    v5 = request.POST.get('gender')
    v6 = request.POST.get('street')
    v7 = request.POST.get('zipcode')
    v8 = request.POST.get('city')
    v9 = request.POST.get('country')

    if v1=="": print("No name")
    elif v2=="": print("No email")
    elif v3=="": print("No username")
    elif v4=="": print("No password")
    elif v5=="": print("No gender")
    elif v6=="": print("No street")
    elif v7=="": print("No zipcode")
    elif v8=="": print("No city")
    elif v9=="": print("No country")
    else:
        dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
        conn = cx_Oracle.connect(user='INNOCITY', password='2108', dsn=dsn_tns)
        cur = conn.cursor()
        print(cur)
        print('Success')

        cur.execute("SELECT * from CUSTOMER")
        for row in cur:
            print(row)

        sql_customer_num = "SELECT COUNT(*) FROM CUSTOMER"
        cur.execute(sql_customer_num)
        customer_num = cur.fetchone()[0]
        customer_num+=1
        print(customer_num)
        print(v1)
        print(v2)

        sql_add_user = "INSERT INTO CUSTOMER (customerId, name, email, username, password, gender, street, zipcode, city, country) VALUES ( :vv0 ,:vv1 , :vv2 , :vv3 , :vv4 , :vv5 , :vv6 , :vv7 , :vv8 , :vv9 )"

        v0 = customer_num

        cur.execute(sql_add_user,[v0,v1,v2,v3,v4,v5,v6,v7,v8,v9])
        conn.commit()

        print("HOISEEEEEEEEE")

        conn.commit()
        cur.close()
        conn.close()
        return HttpResponse("<h1>CONGRATS</h1>")

    return render(request, 'register/index.html', {'alert_flag': True})




