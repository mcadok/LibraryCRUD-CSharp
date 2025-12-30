create database library_72886
use library_72886

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL
);

CREATE TABLE Places (
    PlaceID INT PRIMARY KEY IDENTITY(1,1),
    Street VARCHAR(255) NOT NULL,
    StreetNr INT NOT NULL,
    City VARCHAR(255) NOT NULL
);

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    phoneNr VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255) NOT NULL,
    AuthorID INT NOT NULL,
    year_of_pub INT,
    CONSTRAINT FK_Books_Authors FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Workers (
    WorkerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Salary DECIMAL(20,2) NOT NULL,
    phoneNr VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PlaceID INT NOT NULL,
    CONSTRAINT FK_Workers_Places FOREIGN KEY (PlaceID) REFERENCES Places(PlaceID)
);

CREATE TABLE Rent (
    RentID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    ClientID INT NOT NULL,
    WorkerID INT NOT NULL,
    PlaceID INT NOT NULL,
    rental_date DATE NOT NULL DEFAULT GETDATE(),
    return_date DATE NOT NULL,
    CONSTRAINT FK_Rent_Books FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_Rent_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    CONSTRAINT FK_Rent_Workers FOREIGN KEY (WorkerID) REFERENCES Workers(WorkerID),
    CONSTRAINT FK_Rent_Places FOREIGN KEY (PlaceID) REFERENCES Places(PlaceID)
);




INSERT INTO Places (Street, StreetNr, City) VALUES 
('Baker St', 221, 'London'),
('Oxford St', 10, 'London'),
('Piccadilly', 50, 'London')

INSERT INTO Authors (FirstName, LastName) VALUES 
('George', 'Orwell'), ('Stephen', 'King'), ('J.K.', 'Rowling'), 
('Ernest', 'Hemingway'), ('Agatha', 'Christie'), ('John', 'Steinbeck'),
('Mark', 'Twain'), ('Oscar', 'Wilde'), ('Virginia', 'Woolf'), ('H.P.', 'Lovecraft');

INSERT INTO Clients (FirstName, LastName, phoneNr, email) VALUES 
('Tom', 'Blue', '5001', 'tom@mail.com'),
('Ben', 'Red', '5002', 'ben@mail.com'),
('Ann', 'Grey', '5003', 'ann@mail.com'),
('Joe', 'Black', '5004', 'joe@mail.com'),
('Mia', 'White', '5005', 'mia@mail.com'),
('Bob', 'Green', '5006', 'bob@mail.com'),
('Liz', 'Gold', '5007', 'liz@mail.com'),
('Sam', 'Silver', '5008', 'sam@mail.com'),
('Ian', 'Pink', '5009', 'ian@mail.com'),
('Amy', 'Brown', '5010', 'amy@mail.com');

INSERT INTO Workers (FirstName, LastName, Salary, phoneNr, email, PlaceID) VALUES 
('Adam', 'Smith', 4500.00, '111000', 'adam@lib.com', 1),
('Eve', 'Green', 4200.00, '222000', 'eve@lib.com', 2),
('Sam', 'Cook', 4300.00, '333000', 'sam@lib.com', 3);

INSERT INTO Books (Title, AuthorID, year_of_pub) VALUES 
('1984', 1, 1949), ('Animal Farm', 1, 1945), ('The Road', 1, 1937),
('It', 2, 1986), ('Cujo', 2, 1981), ('Misery', 2, 1987), ('The Shining', 2, 1977),
('Harry 1', 3, 1997), ('Harry 2', 3, 1998), ('Harry 3', 3, 1999), ('Harry 4', 3, 2000), ('Harry 5', 3, 2003),
('Old Man', 4, 1952), ('The Sun', 4, 1926), ('A Farewell', 4, 1929),
('Poirot', 5, 1920), ('Marple', 5, 1930), ('ABC Murders', 5, 1936),
('The Pearl', 6, 1947), ('Of Mice', 6, 1937), ('East of Eden', 6, 1952),
('Tom Sawyer', 7, 1876), ('Huckleberry', 7, 1884),
('Dorian Gray', 8, 1890), ('The Waves', 9, 1931), ('Orlando', 9, 1928),
('Cthulhu', 10, 1928), ('Dagon', 10, 1919), ('Dracula', 5, 1897), ('Moby Dick', 7, 1851);

INSERT INTO Rent (BookID, ClientID, WorkerID, PlaceID, rental_date, return_date) VALUES 
(1, 1, 1, 1, '2024-01-01', '2024-01-15'),
(2, 2, 1, 1, '2024-01-05', '2024-01-20'),
(8, 3, 2, 2, '2024-01-10', '2024-01-25'),
(12, 4, 3, 3, '2024-01-15', '2024-01-30'),
(21, 5, 1, 1, '2024-02-01', '2024-02-15'),
(4, 6, 2, 2, '2024-02-05', '2024-02-20'),
(24, 7, 3, 3, '2024-02-10', '2024-02-25'),
(27, 8, 1, 1, '2024-02-15', '2024-03-01'),
(15, 9, 2, 2, '2024-03-01', '2024-03-15'),
(18, 10, 3, 3, '2024-03-05', '2024-03-20');