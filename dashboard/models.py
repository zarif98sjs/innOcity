

class Customer:

    def __init__(self, customer_id, name=None, email=None, username=None, gender=None,
                 street=None, zipcode=None, city=None, country=None, phone=None, card_username=None, card_type=None,
                 card_number=None,  mob_banking_phone_number=None, mob_banking_service_provider=None, cvc=None):

        self.customer_id = customer_id
        self.name = name
        self.email = email
        self.username = username
        self.gender = gender
        self.street = street
        self.zipcode = zipcode
        self.city = city
        self.country = country
        self.phone = phone
        self.card_username = card_username
        self.card_type = card_type
        self.card_number = card_number
        self.mob_banking_phone_number = mob_banking_phone_number
        self.mob_banking_service_provider = mob_banking_service_provider
        self.cvc = cvc


class Reservation:

    def __init__(self, reservation_id, date_of_arrival, date_of_departure, hotelId, hotel_name, city, country, room_type, cost):

        self.reservation_id = reservation_id
        self.date_of_arrival = date_of_arrival.date()
        self.date_of_departure = date_of_departure.date()
        self.stay = (self.date_of_departure - self.date_of_arrival).days
        self.hotelId = hotelId
        self.hotel_name = hotel_name
        self.city = city
        self.country = country
        self.room_type = room_type
        self.services = []
        self.cost = cost * self.stay


