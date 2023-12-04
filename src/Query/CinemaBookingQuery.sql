create database CinamaBooking
go

use CinemaBooking
go

create table Users
(
	userID int identity(1,1) primary key,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	userName varchar(50) not null,
	passwordU varchar(50) not null
)
go

create table BankAccount
(
	bankNumber int identity(1,1) primary key,
	Users_userID int not null,
	CONSTRAINT FK_UsersBankAccount FOREIGN KEY (Users_userID) REFERENCES Users(userID),
	moneyBA int
)
go

create table Reservation
(
	reserveID int identity(1,1) primary key,
	User_userID int not null,
	CONSTRAINT FK_PersonReservation FOREIGN KEY (User_userID) REFERENCES Users(userID),
	Schedule_scheduleID int not null,
	reserveDate datetime not null,
)
go

create table Payment
(
	PaymentID int identity(1,1) primary key,
	Reservation_reserveID int not null,
	CONSTRAINT FK_ReservationPayment FOREIGN KEY (Reservation_reserveID) REFERENCES Reservation(reserveID),
	amount int not null,
	paymentDate datetime
)
go

create table Movies
(
	movieID int identity(1,1) primary key,
	title varchar(100),
	duration time,
	genre varchar(100)
)
go

create table Schedule
(
	scheduleID int identity(1,1) primary key,
	Movies_movieID int not null,
	CONSTRAINT FK_MoviesSchedule FOREIGN KEY (Movies_movieID) REFERENCES Movies(movieID),
	Location_locationID int identity(1,1) not null,
	DateSchedule datetime
)
go

alter table Reservation
add CONSTRAINT FK_ScheduleReservation FOREIGN KEY (Schedule_scheduleID) REFERENCES Schedule(scheduleID);
go

create table Seat
(
	seatID int identity(1,1) primary key,
	rowSeat varchar(10),
	number int not null,
	statusSeat bit not null,
	totalSeats int not null,
	seatReserved int not null
)
go

create table Auditorium
(
	auditoriumID int identity(1,1) primary key,
	nameAuditorium varchar(50) not null
)
go

create table Cinema
(
	cinemaID int identity(1,1) primary key,
	nameCinema varchar(50),
	locationCinema varchar(100)
)
go

create table Location
(
	locationID int identity(1,1) primary key,
	Seat_seatID int ,
	CONSTRAINT FK_SeatLocation FOREIGN KEY (Seat_seatID) REFERENCES Seat(seatID),
	Auditorium_auditoriumID int ,
	CONSTRAINT FK_AuditoriumLocation FOREIGN KEY (Auditorium_auditoriumID) REFERENCES Auditorium(auditoriumID),
	Cinema_cinemaID int ,
	CONSTRAINT FK_CinemaLocation FOREIGN KEY (Cinema_cinemaID) REFERENCES Cinema(cinemaID)
)
go

alter table Schedule
add CONSTRAINT FK_LocaitonSchedule FOREIGN KEY (Location_locationID) REFERENCES Location(locationID);
go