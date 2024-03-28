-- Create a new database
CREATE DATABASE library;

-- Use the newly created database
USE library;

-- Create Tables
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    BookID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert into Books
INSERT INTO Books (BookID, Title, Author, Genre, Price, StockQuantity)
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 19.99, 100),
    (2, 'Gone Girl', 'Gillian Flynn', 'Mystery', 24.99, 50),
    (3, 'A Game of Thrones', 'George R. R. Martin', 'Fantasy', 30.09, 20),
    (4, 'How Does She Do It?', 'Paris Fury', 'Autobiography', 29.99, 60);

-- Insert into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210'),
    (3, 'Jen', 'Wolf', 'jen.wolf@email.com', '237-372-2738'),
    (4, 'Jam', 'Frog', 'jam.frog@email.com', '231-312-4678');

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-09-28', 44.98),
    (2, 2, '2023-09-29', 24.99),
    (3, 3, '2023-09-30', 44.98),
    (4, 4, '2023-09-31', 30.98);

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, Subtotal)
VALUES
    (1, 1, 1, 2, 39.98),
    (2, 2, 2, 1, 24.99),
    (3, 3, 2, 1, 24.99),
    (4, 4, 2, 1, 30.09);

-- Insert into Reviews
INSERT INTO Reviews (ReviewID, BookID, CustomerID, Rating, Comment, ReviewDate)
VALUES
    (1, 1, 1, 5, 'Great book!', '2023-09-28'),
    (2, 2, 2, 4, 'Enjoyable mystery.', '2023-09-29'),
    (3, 3, 3, 4, 'I liked it.', '2023-09-31'),
    (4, 4, 4, 3, 'I think that it was okay.', '2023-10-01');
    
-- Delete a specific book by BookID
DELETE FROM Books WHERE BookID = 2;

-- Retrieve all books
SELECT * FROM Books;

-- Retrieve all customers
SELECT * FROM Customers;

-- Retrieve all orders
SELECT * FROM Orders;

-- Retrieve all order details
SELECT * FROM OrderDetails;

-- Retrieve all reviews
SELECT * FROM Reviews;