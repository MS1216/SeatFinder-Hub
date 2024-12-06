-- Make sure you have a database named "seatfinder"
-- CREATE DATABASE seatfinder;

USE seatfinder;

-- Drop tables if they already exist (use with caution!)
DROP TABLE IF EXISTS Reservations;
DROP TABLE IF EXISTS Seats;
DROP TABLE IF EXISTS Users;

-- Create the Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL
);

-- Create the Seats table
CREATE TABLE Seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    seat_row VARCHAR(10) NOT NULL,
    seat_number INT NOT NULL,
    stadium_id INT NOT NULL
    -- Optionally, if you have a Stadiums table, add a foreign key:
    -- FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id)
);

-- Create the Reservations table
CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    seat_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);

-- Insert a test user
INSERT INTO Users (username, password_hash) VALUES 
('testuser', 'ReplaceThisWithAHashedPassword');

-- Insert some sample seats for stadium_id = 1
INSERT INTO Seats (seat_row, seat_number, stadium_id) VALUES 
('A', 1, 1),
('A', 2, 1),
('B', 1, 1),
('B', 2, 1);

-- Optionally insert a reservation to test reserved seats display
-- For example, reserve seat_id = 1 for user_id = 1, event_id = 1
-- INSERT INTO Reservations (user_id, event_id, seat_id) VALUES (1, 1, 1);
