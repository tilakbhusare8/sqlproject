CREATE DATABASE onlineBookStore;
USE onlineBookStore;
CREATE TABLE authers(
autherID INT PRIMARY KEY,
autherName VARCHAR(50)
);
CREATE TABLE book(
bookID INT PRIMARY KEY,
title VARCHAR(50),
autherID INT,
price DECIMAL(10,2),
FOREIGN KEY (autherID) REFERENCES authers(autherID)
);
CREATE TABLE customers(
customerID INT PRIMARY KEY,
customerName VARCHAR(50),
email VARCHAR(50)
);
CREATE TABLE orders(
orderID INT PRIMARY KEY,
customerID INT,
bookID INT ,
orderDate DATE,
FOREIGN KEY (customerID) REFERENCES customers(customerID),
FOREIGN KEY (bookID) REFERENCES book(bookID)
);
#insert authers
INSERT INTO  authers VALUES(1,'Dr.APJ Abdul Kalam'),(2,'Dr.Subhash Chandra Bose');
INSERT INTO book VALUES(1, 'Wings Of Fire',1,49.50),(2,"I Am Subhash",2,50.25);
INSERT INTO customers VALUES(1,'Tilak','tilakbhusare555@gmail.com'),(2,'Ram','ram@gmail.com');
INSERT INTO orders VALUES(1,1,1,'2023-01-10'),(2,2,2,'2022-03-15');

# list all books and their auther:
SELECT book.title,authers.autherName
FROM book
JOIN authers ON book.autherID=authers.autherID;

#find books by a specific auther:
SELECT title FROM book
WHERE autherID=1;

#display orders with customer information:
SELECT orders.orderID,customers.customerName,book.title,orders.orderDate
FROM orders
JOIN customers ON orders.customerID=customers.customerID
JOIN book ON orders.bookID=book.bookID;

#update book price:
UPDATE book
SET price=50.00
WHERE bookID=1;

#generate a report of total sales by book:
SELECT book.title, SUM(book.price) AS totalSales
FROM orders
JOIN book ON orders.bookID=book.bookID
GROUP BY book.title;
