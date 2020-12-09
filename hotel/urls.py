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
    path('<int:hotel_id>/book/', views.book, name='book'),
    path('<int:hotel_id>/book2/', views.book2, name='book2'),
    path('<int:hotel_id>/payment/', views.payment, name='payment'),
    path('<int:hotel_id>/payment_method/', views.payment_method, name='payment_method'),
    path('<int:hotel_id>/mobile_banking/', views.mobile_banking, name='mobile_banking'),
    path('<int:hotel_id>/mobile_banking_fetch/', views.mobile_banking_fetch, name='mobile_banking_fetch'),
    path('<int:hotel_id>/credit_card/', views.credit_card, name='credit_card'),
    path('<int:hotel_id>/credit_card_fetched/', views.credit_card_fetch, name='credit_card_fetch'),
    path('<int:hotel_id>/complete_payment/', views.complete_payment, name='complete_payment')
]