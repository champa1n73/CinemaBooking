--- Insert Cinema
-- DELETE FROM Cinemas
DBCC CHECKIDENT ('Cinemas', RESEED, 0);
go
INSERT INTO dbo.Cinemas (cinemaName, cinemaAddress)
VALUES ('Grand Lake Theatre', 'Oakland'),
       ('Cinema São Jorge', 'Lisbon'),
       ('The Projector', 'Singapore'),
       ('Curzon Bloomsbury', 'London'),
       ('Paris Theater', 'New York'),
       ('Genesis Cinema', 'London'),
       ('Museum Lichtspiele', 'Munich'),
       ('Le Cinéma du Pantheon', 'Paris'),
       ('Golden Age Cinema and Bar', 'Sydney'),
       ('Egyptian Theatre', 'Los Angeles')
go

--- Insert Movie
-- DELETE FROM Movies
DBCC CHECKIDENT ('Movies', RESEED, 0);
go
INSERT INTO dbo.Movies (movieName, duration, genre, directorName)
VALUES ('The Departed', '02:31:00', 'Crime, Drama, Thriller', 'Martin Scorsese'),
       ('Good Will Hunting', '02:06:00', 'Drama, Romance', 'Gus Van Sant'),
       ('Inception', '02:28:00', 'Action, Adventure, Sci-Fi', 'Christopher Nolan'),
       ('Interstellar', '02:49:00', 'Adventure, Drama, Sci-Fi', 'Christopher Nolan'),
       ('The Dark Knight Rises', '02:44:00', 'Action, Drama, Thriller', 'Christopher Nolan'),
       ('The Dark Knight', '02:32:00', 'Action, Crime, Drama', 'Christopher Nolan'),
       ('The Sting', '02:09:00', 'Comedy, Crime, Drama', 'George Roy Hill'),
       ('La Grande Vadrouille', '02:12:00', 'Adventure, Comedy, War', 'Gérard Oury'),
       ('The Godfather', '02:55:00', 'Crime, Drama', 'Francis Ford Coppola'),
       ('Pulp Fiction', '02:34:00', 'Crime, Drama', 'Quentin Tarantino')
go

--- Insert Auditorium
-- DELETE FROM Auditorium
DBCC CHECKIDENT ('Auditorium', RESEED, 0);
go
INSERT INTO dbo.Auditorium (cinemaID, auditoriumName)
VALUES (1, 'Auditorium 1'),
       (1, 'Auditorium 2'),
       (1, 'Auditorium 3'),
       (1, 'Auditorium 4'),
       (1, 'Auditorium 5'),
	   (2, 'Auditorium 1'),
       (2, 'Auditorium 2'),
       (2, 'Auditorium 3'),
       (2, 'Auditorium 4'),
       (2, 'Auditorium 5'),
	   (3, 'Auditorium 1'),
       (3, 'Auditorium 2'),
       (3, 'Auditorium 3'),
       (3, 'Auditorium 4'),
       (3, 'Auditorium 5'),
	   (4, 'Auditorium 1'),
       (4, 'Auditorium 2'),
       (4, 'Auditorium 3'),
       (4, 'Auditorium 4'),
       (4, 'Auditorium 5'),
	   (5, 'Auditorium 1'),
       (5, 'Auditorium 2'),
       (5, 'Auditorium 3'),
       (5, 'Auditorium 4'),
       (5, 'Auditorium 5')
go

--- Insert Seat
-- DELETE FROM Seats
DBCC CHECKIDENT ('Seats', RESEED, 0);
go
DECLARE @auditoriumID int;
DECLARE @seatID int;

SET @auditoriumID = 1;

WHILE @auditoriumID <= 25
BEGIN
    SET @seatID = 1;

    WHILE @seatID <= 10
    BEGIN
        INSERT INTO Seats(auditoriumID, statusSeat, rowLocation)
        VALUES (@auditoriumID, 'Available', 'A' + CAST(@seatID AS varchar(10)));

        SET @seatID = @seatID + 1;
    END
	SET @seatID = 1;

    WHILE @seatID <= 10
    BEGIN
        INSERT INTO Seats(auditoriumID, statusSeat, rowLocation)
        VALUES (@auditoriumID, 'Available', 'B' + CAST(@seatID AS varchar(10)));

        SET @seatID = @seatID + 1;
    END
	SET @seatID = 1;

    WHILE @seatID <= 10
    BEGIN
        INSERT INTO Seats(auditoriumID, statusSeat, rowLocation)
        VALUES (@auditoriumID, 'Available', 'C' + CAST(@seatID AS varchar(10)));

        SET @seatID = @seatID + 1;
    END

    SET @auditoriumID = @auditoriumID + 1;
END
go

--- Insert Schedule
-- DELETE FROM Schedule
DBCC CHECKIDENT ('Schedule', RESEED, 0);
go
DECLARE @mID INT = 1;
DECLARE @date DATETIME = GETDATE();
WHILE @mID <= 10
BEGIN
	DECLARE @a INT = 1;
	WHILE @a <= 30
	BEGIN
		INSERT INTO dbo.Schedule (movieID, auditoriumID, scheduleDate, totalTicket, ticketsSold, ticketPrice)
		VALUES (@mID, (CAST(RAND()*25 AS INT) % 25) + 1, DATEADD(HOUR, CAST((RAND() * 24) AS INT), @date), 100, 0, 8)    
		SET @a = @a + 1;
	END
	SET @mID = @mID + 1;
END
go

INSERT INTO dbo.Schedule (movieID, auditoriumID, scheduleDate, totalTicket, ticketsSold, ticketPrice)
values(1, 1, '2023-12-26 14:30:00', 100, 0 ,8), (2, 2, '2023-12-19 11:30:00', 100, 0, 8), (3, 3, '2023-12-19 11:30:00', 100, 0, 8), (4, 4, '2023-12-20 11:30:00', 100, 0, 8),
(5, 5, '2023-12-19 13:30:00', 100, 0, 8), (6, 6, '2023-12-19 15:30:00', 100, 0, 8), (7, 7, '2023-12-21 10:30:00', 100, 0, 8),
(8, 8, '2023-12-21 18:30:00', 100, 0, 8), (9, 9, '2023-12-18 14:30:00', 100, 0, 8), (10, 10, '2023-12-25 13:30:00', 100, 0, 8),
(1, 11, '2023-12-22 15:30:00', 100, 0, 8), (2, 12, '2023-12-19 14:00:00', 100, 0, 8), (3, 13, '2023-12-23 11:30:00', 100, 0, 8),
(4, 14, '2023-12-24 11:30:00', 100, 0, 8), (5, 15, '2023-12-25 10:30:00', 100, 0, 8), (6, 16, '2023-12-19 18:30:00', 100, 0, 8), 
(7, 17, '2023-12-19 16:30:00', 100, 0, 8), (8, 18, '2023-12-19 19:30:00', 100, 0, 8), (9, 19, '2023-12-19 20:30:00', 100, 0, 8),
(10, 20, '2023-12-29 11:30:00', 100, 0, 8), (1, 21, '2023-12-19 21:30:00', 100, 0, 8), (2, 22, '2023-12-19 22:30:00', 100, 0, 8),
(3, 23, '2023-12-20 20:30:00', 100, 0, 8), (4, 24, '2023-12-25 20:30:00', 100, 0, 8), (5, 25, '2023-12-25 20:30:00', 100, 0, 8)
