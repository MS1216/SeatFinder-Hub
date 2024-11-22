DROP DATABASE IF EXISTS seatFinder;
CREATE DATABASE seatFinder;
USE SeatFinder;

CREATE TABLE Users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    passwordHash VARCHAR(255) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Participants (
    participantID INT PRIMARY KEY AUTO_INCREMENT,
    participantName VARCHAR(50) UNIQUE NOT NULL,
    userID INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);
    
CREATE TABLE Stadiums (
    stadiumID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    state CHAR(2) DEFAULT 'TX',
    capacity INT
);

CREATE TABLE Events (
    eventID INT PRIMARY KEY AUTO_INCREMENT,
    stadiumID INT,                      -- Foreign key to link each event to a stadium
    name VARCHAR(100) NOT NULL,          -- Event name (e.g., concert, game)
    date DATE NOT NULL,                  
    time TIME NOT NULL,                  
    FOREIGN KEY (stadiumID) REFERENCES Stadiums(stadiumID) ON DELETE CASCADE
);

CREATE TABLE Sports (
	eventID INT PRIMARY KEY,
    stadiumID INT,
    sportType VARCHAR(100) NOT NULL,
    FOREIGN KEY (eventID) REFERENCES Events(eventID) ON DELETE CASCADE,
    FOREIGN KEY (stadiumID) REFERENCES Events(stadiumID) ON DELETE CASCADE
);

CREATE TABLE Concert (
	eventID INT PRIMARY KEY,
    stadiumID INT,
    artistName VARCHAR (100) NOT NULL,
    FOREIGN KEY (eventID) REFERENCES Events(eventID) ON DELETE CASCADE,
    FOREIGN KEY (stadiumID) REFERENCES Events(stadiumID) ON DELETE CASCADE
);

CREATE TABLE Seats (
    seatID INT NOT NULL,
    seatRow INT NOT NULL,
    seatNumber INT NOT NULL,
    stadiumID INT,                      -- Foreign key to link each seat to a stadium
    FOREIGN KEY (stadiumID) REFERENCES Stadiums(stadiumID) ON DELETE CASCADE,
    PRIMARY KEY (seatID, seatRow, seatNumber)
);

CREATE TABLE Reservations (
    reservationID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,                         -- Foreign key to link reservation to a user
    eventID INT,                        -- Foreign key to link reservation to an event
    seatID INT,                         -- Foreign key to link reservation to a specific seat
    reservedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (eventID) REFERENCES Events(eventID) ON DELETE CASCADE,
    FOREIGN KEY (seatID) REFERENCES Seats(seatID) ON DELETE CASCADE
);

INSERT INTO Users(username, email, passwordHash)
VALUES ('Michael', 'MEmail', 'M1234'),
('Terry', 'TEmail', 'T2345'),
('Sean', 'SEmail', 'S3456'),
('Emmanuel', 'EEmail', 'E4567');

INSERT INTO Stadiums(name, city, state, capacity)
VALUES('NRG Stadium', 'Houston', 'TX', 72220),
('Minute Maid Park', 'Houston', 'TX', 42060),
('Toyota Center', 'Houston', 'TX', 19300);

INSERT INTO Events(stadiumID, name, date, time)
VALUES(1, 'Texans Game', '2024-11-18', '19:15:00'),
(2, 'Astros Game', '2024-11-09', '14:15:00'),
(3, 'Rockets Game', '2024-11-18', '18:30:00');

select * from Users;




