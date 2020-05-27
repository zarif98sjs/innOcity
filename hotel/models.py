from django.db import models

# Create your models here.


class Session:

    def __init__(self, id, checkin_date, checkout_date):

        self.id = id
        self.checkin_date = checkin_date
        self.checkout_date = checkout_date


class Hotel:

    def __init__(self, hotelId, name, street, zipcode, city, country, rating, rating_count):

        self.hotelId = hotelId
        self.name = name
        self.street = street
        self.zipcode = zipcode
        self.city = city
        self.country = country
        self.rating = rating
        self.rating_count = rating_count
        self.rooms = 0
        self.facilities = ""

    def set_rooms(self, rooms):
        self.rooms = rooms

    def add_facilities(self, facility_list):

        for i in range(len(facility_list)):
            if i > 0:
                self.facilities += ', '
            self.facilities += facility_list[i]

    def __str__(self):
        return self.name


class Room:

    def __init__(self, roomId, room_type, bed_type, cost, discount, special_offer):

        self.roomId = roomId
        self.room_type = room_type
        self.bed_type = bed_type
        self.cost = cost
        self.discount = discount
        self.special_offer = special_offer
        self.facilities = ""

    def add_facilities(self, facility_list):

        for i in range(len(facility_list)):
            if i > 0:
                self.facilities += ', '
            self.facilities += facility_list[i]

    def __str__(self):
        return str(self.roomId) + " " + self.room_type





