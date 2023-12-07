create database cinemabooking
go
use cinemabooking
go



create table Users
(
	userName varchar(32) primary key,
	userPassword varchar(32) not null,
	firstName varchar(20) not null,
	lastName varchar(20) not null

)

create table BankAccount
(
	userName varchar(32) not null,
	bankNumber int primary key,
	bankMoney money not null,
	bankOTP int not null,

	constraint FK_BankAccount_Users
	foreign key (userName) references Users(userName)
)

create table Movies
(
	movieID int identity(1, 1) primary key,
	movieName varchar(50) not null,
	duration time not null,
	genre varchar(20) not null,
	directorName varchar(50) not null
)

create table Cinemas
(
	cinemaID int identity(1, 1) primary key,
	cinemaName varchar(50) not null,
	cinemaAddress varchar(100) not null
)

create table Auditorium
(
	cinemaID int not null,
	auditoriumID int identity(1, 1) primary key,
	auditoriumName varchar(50) not null,
	
	constraint FK_Auditorium_Cinemas
	foreign key (cinemaID) references Cinemas(cinemaID)
)

create table Seats
(
	auditoriumID int not null,
	seatID int identity(1, 1) primary key,
	statusSeat varchar(20) not null,
	rowLocation varchar(10) not null,

	constraint FK_Seats_Auditorium
	foreign key (auditoriumID) references Auditorium(auditoriumID)
)

create table Schedule
(
	scheduleID int identity(1, 1) primary key,
	movieID int not null,
	auditoriumID int not null,
	scheduleDate datetime not null,
	totalTicket int not null,
	ticketsSold int not null,
	ticketPrice money not null,

	constraint FK_Schedule_Movies
	foreign key (movieID) references Movies(movieID),

	constraint FK_Schedule_Auditorium
	foreign key (auditoriumID) references Auditorium(auditoriumID)
	
)

create table Reservation
(
	reserveID int identity(1, 1) primary key,
	userName varchar(32) not null,
	scheduleID int not null,
	seatID int not null,
	reserveDate datetime not null,
	paymentStatus varchar(20) not null,

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
	userName varchar(32) not null,
	reserveID int not null,
	amount money not null,
	paymentDate datetime not null,

	constraint FK_Payment_Users
	foreign key (userName) references Users(userName),

	constraint FK_Payment_Reservation
	foreign key (reserveID) references Reservation(reserveID)
)



