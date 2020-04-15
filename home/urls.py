from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('about/', views.about, name='about'),
    path('contact/', views.contacts, name='contact'),
    path('destinations/', views.destinations, name='destinations'),
    path('news/', views.news, name='news'),

]