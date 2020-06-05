from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('maps/', views.maps, name='maps'),
    path('user/', views.user, name='user'),
]