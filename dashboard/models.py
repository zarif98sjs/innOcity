

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

