DROP DATABASE IF EXISTS seatFinder;
CREATE DATABASE seatFinder;
USE SeatFinder;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Stadiums (
    stadium_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    state CHAR(2) DEFAULT 'TX',
    capacity INT
);

CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    stadium_id INT,                      -- Foreign key to link each event to a stadium
    name VARCHAR(100) NOT NULL,          -- Event name (e.g., concert, game)
    date DATE NOT NULL,                  
    time TIME NOT NULL,                  
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id) ON DELETE CASCADE
);

CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    stadium_id INT,                      -- Foreign key to link each seat to a stadium
    seat_row CHAR(1),                    -- Row letter (A, B, C, etc.)
    seat_number INT,                     -- Seat number within the row
    is_reserved BOOLEAN DEFAULT FALSE,   -- Reservation status
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id) ON DELETE CASCADE
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,                         -- Foreign key to link reservation to a user
    event_id INT,                        -- Foreign key to link reservation to an event
    seat_id INT,                         -- Foreign key to link reservation to a specific seat
    reserved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id) ON DELETE CASCADE
);














