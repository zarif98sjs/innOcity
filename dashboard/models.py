

class Customer:

    def __init__(self, customer_id, name=None, email=None, username=None, gender=None,
                 street=None, zipcode=None, city=None, country=None):

        self.customer_id = customer_id
        self.name = name
        self.email = email
        self.username = username
        self.gender = gender
        self.street = street
        self.zipcode = zipcode
        self.city = city
        self.country = country


class Reservation:

    def __init__(self, reservation_id, date_of_arrival, date_of_departure, hotel_id):

        self.reservation_id = reservation_id
        self.date_of_arrival = date_of_arrival.date()
        self.date_of_departure = date_of_departure.date()
        self.stay = (self.date_of_departure - self.date_of_arrival).days
        self.hotel_id = hotel_id
        self.hotel_name = None
        self.city = None
        self.country = None
        self.room_type = None
        self.services = []
        self.cost = 0





