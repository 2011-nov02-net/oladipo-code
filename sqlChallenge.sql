CREATE SCHEMA Store;
GO


CREATE TABLE Orders
{
      ID INT NOT NULL IDENTITY
      ProductId 
       FOREIGN KEY REFERENCES Products (ID) ON DELETE CASCADE ON UPDATE CASCADE,
      CustomerId
      FOREIGN KEY REFERENCES Customers (ID) ON DELETE CASCADE ON UPDATE CASCADE,
      PRIMARY KEY ( Products.ID, Customers.ID),
}


CREATE TABLE Products
{
    ID INT NOT NULL PRIMARY KEY IDENTITY,
    Name NVARCHAR(200) NOT NULL,
    Price DECIMAL NOT NULL CHECK ( Price > 0);

}


CREATE TABLE  Customers
{
   ID INT NOT NULL PRIMARY KEY IDENTITY,
   Firstname NVARCHAR(150) NOT NULL,
   Lastname NVARCHAR(150) NOT NULL,
   CardNumber INT NOT NULL UNIQUE;

}

-- Add at least 3 records into each table
INSERT INTO Customers ( Firstname, Lastname, CardNumber) VALUES 
      ('Tom', 'Brady', 123456),
      ('Aaron', 'Rodgers', 123457),
      ('Russel', 'Wilson', 123459);

INSERT INTO Products ( Name, Price) VALUES 
      ('Banana', 3.50),
      ('Apple', 2.78),
      ('Grapes', 5.00);

INSERT INTO Orders ( CustomerId, ProductId)  VALUES 

     ( (SELECT CustomerId FROM Customers WHERE Firstname = 'Tom'), (SELECT ProductId FROM  Products WHERE Name = 'Banana')),
     ( (SELECT CustomerId FROM Customers WHERE Firstname = 'Aaron'), (SELECT ProductId FROM  Products WHERE Name = 'Apple')),
     ( (SELECT CustomerId FROM Customers WHERE Firstname = 'Russel'), (SELECT ProductId FROM  Products WHERE Name = 'Grapes'));

--add iphone
INSERT INTO Products ( Name, Price) VALUES
( 'Iphone', 200 );

--add Tina Smith 
INSERT INTO Customers ( Firstname, Lastname ) VALUES
('Tina', 'Smith', 18374639428);

--create order for Tina smith bought and Iphone
INSERT INTO Orders ( CustomerId, ProductId)  VALUES 

( (SELECT CustomerId FROM Customers WHERE Firstname = 'Tina'), (SELECT ProductId FROM  Products WHERE Name = 'Iphone'));

--report all orders by Tina Smith 
SELECT * FROM  ORDERS 
WHERE CustomerId = (SELECT CustomerId FROM Customers WHERE Firstname = 'Tina' AND Lastname = 'Smith');


--report all revenue genmerated by sales of iphone

SELECT SUM(Price) FROM Orders AS o
    INNER JOIN Products AS p 
    ON o.ProductId = p.ProductId
    WHERE p.Name = 'Iphone';

--increate the price of iphone to $250

UPDATE Products 
SET Price = 250
WHERE Name = 'Iphone';