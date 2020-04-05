from django.shortcuts import render
import cx_Oracle
# Create your views here.

from django.http import HttpResponse
from django.template import loader

def index(request):
    dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='ORCL')
    conn = cx_Oracle.connect(user='hr', password='hr', dsn=dsn_tns)
    c = conn.cursor()
    print(c)
    print('Success')
    c.execute("SELECT * from HR.COUNTRIES")
    out = ''
    print(c)
    for row in c:
        out += str(row) + ' \n\n '
    conn.close()
    line = "<h2> %s </h2>" % out
    #return HttpResponse(line)
    return render(request,'polls/index.html',{'out':out})


# def index(request):
#     dsn_tns  = cx_Oracle.makedsn('localhost','1521',service_name='ORCL')
#     conn = cx_Oracle.connect(user='hr',password='hr',dsn=dsn_tns)
#     c = conn.cursor()
#     print(c)
#     print('Success')
#     c.execute("SELECT * from HR.COUNTRIES")
#     out = ''
#     print(c)
#     for row in c :
#         out +=str(row) + ' \n '
#     conn.close()
#     return HttpResponse(out,content_type="text/plain")