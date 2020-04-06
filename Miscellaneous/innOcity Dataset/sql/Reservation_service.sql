create table Reservation_service
( reservationID INT,
  serviceID INT,
  quantity INT,
  primary key(reservationID, serviceID),
  foreign key(reservationID) references reservation(reservationID),
  foreign key(serviceID) references service(serviceID)
);