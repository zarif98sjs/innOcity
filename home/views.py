from django.shortcuts import render

app_name = 'home'

def index(request):
    return render(request, 'home/index.html')

def about(request):
    return render(request, 'home/about.html')