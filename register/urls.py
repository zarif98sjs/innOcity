from django.urls import path, include
from . import views

urlpatterns = [
    path('',views.index,name='index'),
    path('activate/<uidb64>/<token>/',views.activate, name='activate'),
]