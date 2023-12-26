DELETE FROM Tickets
DBCC CHECKIDENT ('Tickets', RESEED, 0);

DELETE FROM Payment
DBCC CHECKIDENT ('Payment', RESEED, 0);

DELETE FROM Reservation
DBCC CHECKIDENT ('Reservation', RESEED, 0);

update seats
set statusSeat = 'Available'
where statusSeat = 'Unavailable'

select * from payment

select * from tickets

select * from reservation

select * from seats


