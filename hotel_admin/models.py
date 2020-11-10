
class Room:

    def __init__(self, room_type, bed_type, cost_per_day, discount, count):
        self.room_type = room_type
        self.bed_type = bed_type
        self.cost_per_day = cost_per_day
        self.discount = discount
        self.count = count


class Reservation:

    def __init__(self, date_of_arrival, date_of_departure, name, roomId, floor_num, room_type, bed_type, room_charge,
                 service_charge):

        self.date_of_arrival = date_of_arrival.date()
        self.date_of_departure = date_of_departure.date()
        self.stay = (self.date_of_departure - self.date_of_arrival).days
        self.name = name
        self.room_type = room_type
        self.bed_type = bed_type
        self.room_charge = room_charge * self.stay
        self.service_charge = service_charge
        self.total = room_charge + service_charge
        self.floor_num = floor_num
        self.roomId = roomId


class Service:

    def __init__(self, serviceId, service_type, service_subtype, cost):
        self.serviceId = serviceId
        self.service_type = service_type
        self.service_subtype = service_subtype
        self.cost = cost
