create database cinemabooking
go
use cinemabooking
go

create table Users
(
	userID int identity(1, 1) primary key,
	firstName varchar(30),
	lastName varchar(30)
)

create table userAccount
(
	userID int,
	userName varchar(32),
	userPassword varchar(32),

	constraint FK_userAccount_Users
	foreign key (userID) references users(userID)
)

create table BankAccount
(
	userID int,
	bankNumber int primary key,
	bankMoney money,
	bankOTP int,

	constraint FK_BankAccount_Users
	foreign key (userID) references Users(userID)
)

create table Movies
(
	movieName varchar(50) primary key,
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

create table Seats
(
	seatID int identity(1, 1) primary key,
	rowSeat char(1),
	numberSeat int,
	statusSeat varchar(20)
)

create table Auditorium
(
	auditoriumID int identity(1, 1) primary key,
	auditoriumName varchar(50),
)

create table Schedule
(
	scheduleID int identity(1, 1) primary key,
	movieName varchar(50),
	cinemaID int,
	auditoriumID int,
	scheduleDate datetime,
	totalTicket int,
	ticketsSold int,

	constraint FK_Schedule_Movies
	foreign key (movieName) references Movies(movieName),

	constraint FK_Schedule_Cinemas
	foreign key (cinemaID) references Cinemas(cinemaID),

	constraint FK_Schedule_Auditorium
	foreign key (auditoriumID) references Auditorium(auditoriumID)
)

create table Reservation
(
	reserveID int identity(1, 1) primary key,
	userID int,
	scheduleID int,
	seatID int,
	reserveDate datetime,
	paymentStatus varchar(20),

	constraint FK_Reservation_Users 
	foreign key (userID) references Users(userID),

	constraint FK_Reservation_Schedule
	foreign key (scheduleID) references Schedule(scheduleID),

	constraint FK_Reservation_Seats
	foreign key (seatID) references Seats(seatID)
)

create table Payment
(
	paymentID int identity(1, 1) primary key,
	userID int,
	reserveID int,
	amount money,
	paymentDate datetime,

	constraint FK_Payment_Users
	foreign key (userID) references Users(userID),

	constraint FK_Payment_Reservation
	foreign key (reserveID) references Reservation(reserveID)
)


