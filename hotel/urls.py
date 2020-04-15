from django.urls import path
from . import views

urlpatterns = [

    path('available/', views.available, name='available'),
    path('<int:hotel_id>/', views.index, name='index'),
    path('<int:hotel_id>/rooms/', views.rooms, name='rooms'),
    path('<int:hotel_id>/contact/', views.contact, name='contact'),
    path('<int:hotel_id>/about/', views.about, name='about'),
    path('<int:hotel_id>/blog/', views.blog, name='blog'),
    path('<int:hotel_id>/blog-single/', views.blog_single, name='blog_single'),
    path('<int:hotel_id>/services/', views.services, name='services'),

]