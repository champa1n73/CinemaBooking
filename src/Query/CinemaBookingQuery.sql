create database cinemabooking
go
use cinemabooking
go



create table Users
(
	userName varchar(32) primary key,
	userPassword varchar(32),
	firstName varchar(20),
	lastName varchar(20)

)

create table BankAccount
(
	userName varchar(32),
	bankNumber int primary key,
	bankMoney money,
	bankOTP int,

	constraint FK_BankAccount_Users
	foreign key (userName) references Users(userName)
)

create table Movies
(
	movieID int identity(1, 1) primary key,
	movieName varchar(50),
	duration time,
	genre varchar(20),
	directorName varchar(50)
)

create table Cinemas
(
	cinemaID int identity(1, 1) primary key,
	cinemaName varchar(50),
	cinemaAddress varchar(100)
)

create table Auditorium
(
	cinemaID int,
	auditoriumID int identity(1, 1) primary key,
	auditoriumName varchar(50),
	
	constraint FK_Auditorium_Cinemas
	foreign key (cinemaID) references Cinemas(cinemaID)
)

create table Seats
(
	auditoriumID int,
	seatID int identity(1, 1) primary key,
	statusSeat varchar(20),
	rowLocation varchar(10),

	constraint FK_Seats_Auditorium
	foreign key (auditoriumID) references Auditorium(auditoriumID)
)

create table Schedule
(
	scheduleID int identity(1, 1) primary key,
	movieID int,
	auditoriumID int,
	scheduleDate datetime,
	totalTicket int,
	ticketsSold int,

	constraint FK_Schedule_Movies
	foreign key (movieID) references Movies(movieID),

	constraint FK_Schedule_Auditorium
	foreign key (auditoriumID) references Auditorium(auditoriumID)
	
)

create table Reservation
(
	reserveID int identity(1, 1) primary key,
	userName varchar(32),
	scheduleID int,
	seatID int,
	reserveDate datetime,
	paymentStatus varchar(20),

	constraint FK_Reservation_Users 
	foreign key (userName) references Users(userName),

	constraint FK_Reservation_Schedule
	foreign key (scheduleID) references Schedule(scheduleID),

	constraint FK_Reservation_Seats
	foreign key (seatID) references Seats(seatID)
)

create table Payment
(
	paymentID int identity(1, 1) primary key,
	userName varchar(32),
	reserveID int,
	amount money,
	paymentDate datetime,

	constraint FK_Payment_Users
	foreign key (userName) references Users(userName),

	constraint FK_Payment_Reservation
	foreign key (reserveID) references Reservation(reserveID)
)



	