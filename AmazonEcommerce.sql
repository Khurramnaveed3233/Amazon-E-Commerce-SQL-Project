create database AmazonEcommerce 

use AmazonEcommerce

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(20),
    AddressLine1 VARCHAR(255),
    AddressLine2 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    DateJoined DATE
);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, AddressLine1, AddressLine2, City, State, PostalCode, Country, DateJoined)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', '', 'New York', 'NY', '10001', 'USA', '2023-01-10'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak St', 'Apt 2B', 'Los Angeles', 'CA', '90001', 'USA', '2023-02-15'),
('Mike', 'Johnson', 'mike.johnson@example.com', '4567891230', '789 Pine St', '', 'Chicago', 'IL', '60601', 'USA', '2023-03-20'),
('Emily', 'Brown', 'emily.brown@example.com', '3216549870', '101 Maple St', '', 'Houston', 'TX', '77001', 'USA', '2023-04-25'),
('David', 'Williams', 'david.williams@example.com', '6549873210', '202 Cedar St', 'Apt 1A', 'Phoenix', 'AZ', '85001', 'USA', '2023-05-30'),
('Sophia', 'Davis', 'sophia.davis@example.com', '9638527410', '303 Birch St', '', 'Philadelphia', 'PA', '19101', 'USA', '2023-06-10'),
('James', 'Miller', 'james.miller@example.com', '7894561230', '404 Walnut St', '', 'San Antonio', 'TX', '78201', 'USA', '2023-07-12'),
('Olivia', 'Wilson', 'olivia.wilson@example.com', '8527419630', '505 Poplar St', 'Suite 300', 'Dallas', 'TX', '75201', 'USA', '2023-08-17'),
('Liam', 'Moore', 'liam.moore@example.com', '7418529630', '606 Elm St', '', 'San Diego', 'CA', '92101', 'USA', '2023-09-20'),
('Ava', 'Taylor', 'ava.taylor@example.com', '3692581470', '707 Ash St', '', 'San Jose', 'CA', '95101', 'USA', '2023-10-25');

------------------------------------------------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(255),
    CategoryID INT,
    Description VARCHAR(MAX),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    SupplierID INT,
    DateAdded DATE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products (ProductName, CategoryID, Description, Price, StockQuantity, SupplierID, DateAdded)
VALUES 
('Smartphone X', 1, 'Latest smartphone with advanced features', 699.99, 50, 1, '2023-01-15'),
('Laptop Pro', 2, 'High-performance laptop for professionals', 1299.99, 30, 2, '2023-02-18'),
('Wireless Headphones', 3, 'Noise-cancelling wireless headphones', 199.99, 100, 3, '2023-03-22'),
('4K Television', 4, '55-inch 4K UHD Smart TV', 799.99, 20, 4, '2023-04-27'),
('Gaming Console', 5, 'Next-gen gaming console with 1TB storage', 499.99, 25, 5, '2023-05-31'),
('Bluetooth Speaker', 3, 'Portable Bluetooth speaker with deep bass', 149.99, 70, 6, '2023-06-15'),
('Smartwatch Series 5', 1, 'Waterproof smartwatch with heart rate monitor', 299.99, 40, 1, '2023-07-19'),
('DSLR Camera', 2, '24MP DSLR camera with kit lens', 899.99, 15, 7, '2023-08-23'),
('Wireless Mouse', 3, 'Ergonomic wireless mouse with high DPI', 49.99, 200, 3, '2023-09-26'),
('Mechanical Keyboard', 2, 'RGB backlit mechanical keyboard', 119.99, 150, 2, '2023-10-30');


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(100),
    Description TEXT
);

INSERT INTO Categories (CategoryName, Description)
VALUES 
('Electronics', 'Gadgets and electronic devices'),
('Computers', 'Laptops, desktops, and accessories'),
('Accessories', 'Peripheral devices and accessories'),
('Home Entertainment', 'TVs, sound systems, and home entertainment devices'),
('Gaming', 'Consoles, games, and gaming accessories'),
('Wearables', 'Smartwatches, fitness trackers, and wearable devices'),
('Cameras', 'Digital cameras and photography equipment'),
('Audio', 'Headphones, speakers, and audio devices'),
('Appliances', 'Home and kitchen appliances'),
('Smart Home', 'Smart home devices and systems');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    ShippingDate DATE,
    ShippingAddress VARCHAR(255),
    TotalAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(50),
    PaymentStatus VARCHAR(50),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, ShippingDate, ShippingAddress, TotalAmount, OrderStatus, PaymentStatus, PaymentMethod)
VALUES 
(1, '2023-11-01', '2023-11-03', '123 Main St, New York, NY, 10001', 499.99, 'Shipped', 'Paid', 'Credit Card'),
(2, '2023-11-02', '2023-11-04', '456 Oak St, Los Angeles, CA, 90001', 699.99, 'Shipped', 'Paid', 'PayPal'),
(3, '2023-11-03', '2023-11-05', '789 Pine St, Chicago, IL, 60601', 199.99, 'Shipped', 'Paid', 'Credit Card'),
(4, '2023-11-04', '2023-11-06', '101 Maple St, Houston, TX, 77001', 1299.99, 'Shipped', 'Paid', 'Debit Card'),
(5, '2023-11-05', '2023-11-07', '202 Cedar St, Phoenix, AZ, 85001', 799.99, 'Shipped', 'Paid', 'Credit Card'),
(6, '2023-11-06', '2023-11-08', '303 Birch St, Philadelphia, PA, 19101', 149.99, 'Shipped', 'Paid', 'PayPal'),
(7, '2023-11-07', '2023-11-09', '404 Walnut St, San Antonio, TX, 78201', 299.99, 'Shipped', 'Paid', 'Credit Card'),
(8, '2023-11-08', '2023-11-10', '505 Poplar St, Dallas, TX, 75201', 899.99, 'Shipped', 'Paid', 'Debit Card'),
(9, '2023-11-09', '2023-11-11', '606 Elm St, San Diego, CA, 92101', 119.99, 'Shipped', 'Paid', 'Credit Card'),
(10, '2023-11-10', '2023-11-12', '707 Ash St, San Jose, CA, 95101', 49.99, 'Shipped', 'Paid', 'PayPal');


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalPrice AS (Quantity * UnitPrice) PERSISTED,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(1, 2, 1, 499.99),  -- ProductID 2: Laptop Pro
(2, 3, 1, 699.99),  -- ProductID 3: Wireless Headphones
(3, 4, 2, 99.99),   -- ProductID 4: 4K Television
(4, 5, 1, 1299.99), -- ProductID 5: Gaming Console
(5, 6, 1, 799.99),  -- ProductID 6: Bluetooth Speaker
(6, 7, 1, 149.99),  -- ProductID 7: Smartwatch Series 5
(7, 8, 1, 299.99),  -- ProductID 8: DSLR Camera
(8, 9, 1, 899.99),  -- ProductID 9: Wireless Mouse
(9, 10, 2, 49.99),  -- ProductID 10: Mechanical Keyboard
(10, 11, 1, 49.99); -- ProductID 11: Smart Home Device


CREATE TABLE Suppliers (
    SupplierID INT PRIMARY Key IDENTITY(1,1),
    SupplierName VARCHAR(255),
    ContactName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    Country VARCHAR(100)
);

INSERT INTO Suppliers (SupplierName, ContactName, Phone, Email, Address, City, Country)
VALUES 
('TechWorld', 'Alice Green', '1234567890', 'alice@techworld.com', '123 Supplier St', 'San Francisco', 'USA'),
('CompuSuppliers', 'Bob White', '2345678901', 'bob@compusuppliers.com', '456 Supplier Rd', 'Seattle', 'USA'),
('GadgetHub', 'Charlie Brown', '3456789012', 'charlie@gadgethub.com', '789 Supplier Ln', 'Boston', 'USA'),
('HomeElectronics', 'David Black', '4567890123', 'david@homeelectronics.com', '101 Supplier Ave', 'Denver', 'USA'),
('GameTech', 'Eve Adams', '5678901234', 'eve@gametech.com', '202 Supplier Blvd', 'Austin', 'USA'),
('AudioGear', 'Frank Miller', '6789012345', 'frank@audiogear.com', '303 Supplier Ct', 'Portland', 'USA'),
('PhotoExperts', 'Grace King', '7890123456', 'grace@photoexperts.com', '404 Supplier Dr', 'Las Vegas', 'USA'),
('SmartWearables', 'Henry Jones', '8901234567', 'henry@smartwearables.com', '505 Supplier Pkwy', 'Miami', 'USA'),
('AccessoryDepot', 'Isabella Young', '9012345678', 'isabella@accessorydepot.com', '606 Supplier Sq', 'Orlando', 'USA'),
('ApplianceSource', 'Jack White', '0123456789', 'jack@appliancesource.com', '707 Supplier Cir', 'Phoenix', 'USA');

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payments (OrderID, PaymentDate, PaymentAmount, PaymentMethod, PaymentStatus)
VALUES 
(1, '2023-11-01', 499.99, 'Credit Card', 'Paid'),
(2, '2023-11-02', 699.99, 'PayPal', 'Paid'),
(3, '2023-11-03', 199.99, 'Credit Card', 'Paid'),
(4, '2023-11-04', 1299.99, 'Debit Card', 'Paid'),
(5, '2023-11-05', 799.99, 'Credit Card', 'Paid'),
(6, '2023-11-06', 149.99, 'PayPal', 'Paid'),
(7, '2023-11-07', 299.99, 'Credit Card', 'Paid'),
(8, '2023-11-08', 899.99, 'Debit Card', 'Paid'),
(9, '2023-11-09', 119.99, 'Credit Card', 'Paid'),
(10, '2023-11-10', 49.99, 'PayPal', 'Paid');


CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ShippingMethod VARCHAR(100),
    ShippingDate DATE,
    TrackingNumber VARCHAR(50),
    ShippingCost DECIMAL(10, 2),
    DeliveryStatus VARCHAR(50),
    EstimatedDeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Shipping (OrderID, ShippingMethod, ShippingDate, EstimatedDeliveryDate, ShippingCost, DeliveryStatus)
VALUES 
(1, 'Standard', '2023-11-03', '2023-11-06', 10.00, 'Delivered'),
(2, 'Express', '2023-11-04', '2023-11-07', 20.00, 'Delivered'),
(3, 'Standard', '2023-11-05', '2023-11-08', 10.00, 'Delivered'),
(4, 'Express', '2023-11-06', '2023-11-09', 25.00, 'Delivered'),
(5, 'Standard', '2023-11-07', '2023-11-10', 10.00, 'Delivered'),
(6, 'Standard', '2023-11-08', '2023-11-11', 10.00, 'Delivered'),
(7, 'Express', '2023-11-09', '2023-11-12', 20.00, 'Delivered'),
(8, 'Standard', '2023-11-10', '2023-11-13', 10.00, 'Delivered'),
(9, 'Express', '2023-11-11', '2023-11-14', 20.00, 'Delivered'),
(10, 'Standard', '2023-11-12', '2023-11-15', 10.00, 'Delivered');



CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    StockQuantity INT,
    LastRestocked DATE,
    RestockLevel INT,
    SupplierID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Inventory (ProductID, StockQuantity, RestockLevel, SupplierID)
VALUES 
(2, 50, 10, 1),  -- ProductID 2: Laptop Pro
(3, 30, 5, 2),   -- ProductID 3: Wireless Headphones
(4, 100, 20, 3),  -- ProductID 4: 4K Television
(5, 20, 5, 4),   -- ProductID 5: Gaming Console
(6, 25, 5, 5),   -- ProductID 6: Bluetooth Speaker
(7, 70, 15, 6),  -- ProductID 7: Smartwatch Series 5
(8, 40, 10, 1),  -- ProductID 8: DSLR Camera
(9, 15, 3, 7),   -- ProductID 9: Wireless Mouse
(10, 200, 50, 3), -- ProductID 10: Mechanical Keyboard
(11, 150, 30, 2); -- ProductID 11: Smart Home Device


CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Reviews (ProductID, CustomerID, Rating, ReviewText, ReviewDate)
VALUES 
(2, 1, 5, 'Great smartphone with amazing features!', '2023-11-05'),  -- ProductID 2: Laptop Pro
(3, 2, 4, 'Laptop is fast but a bit heavy.', '2023-11-06'),  -- ProductID 3: Wireless Headphones
(4, 3, 5, 'The best headphones I have ever used!', '2023-11-07'),  -- ProductID 4: 4K Television
(5, 4, 4, 'Great TV, but the remote is a bit unresponsive.', '2023-11-08'),  -- ProductID 5: Gaming Console
(6, 5, 3, 'Good console, but it overheats during long gaming sessions.', '2023-11-09'),  -- ProductID 6: Bluetooth Speaker
(7, 6, 5, 'Love the sound quality and portability of these speakers!', '2023-11-10'),  -- ProductID 7: Smartwatch Series 5
(8, 7, 4, 'Smartwatch is great, but battery life could be better.', '2023-11-11'),  -- ProductID 8: DSLR Camera
(9, 8, 5, 'Fantastic DSLR, takes amazing photos.', '2023-11-12'),  -- ProductID 9: Wireless Mouse
(10, 9, 4, 'The mouse is comfortable, but the buttons are too sensitive.', '2023-11-13'),  -- ProductID 10: Mechanical Keyboard
(11, 10, 5, 'Great keyboard, perfect for typing and gaming!', '2023-11-14');  -- ProductID 11: Smart Home Device


CREATE TABLE ShoppingCart (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    AddedDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO ShoppingCart (CustomerID, ProductID, Quantity, AddedDate)
VALUES 
(1, 2, 1, '2023-11-01'),
(2, 3, 2, '2023-11-02'),
(3, 4, 1, '2023-11-03'),
(4, 5, 1, '2023-11-04'),
(5, 6, 2, '2023-11-05'),
(6, 7, 1, '2023-11-06'),
(7, 8, 1, '2023-11-07'),
(8, 9, 2, '2023-11-08'),
(9, 10, 1, '2023-11-09'),
(10, 11, 1, '2023-11-10');


CREATE TABLE WishList (
    WishListID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    AddedDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO WishList (CustomerID, ProductID, AddedDate)
VALUES 
(1, 2, '2023-11-01'),  -- ProductID 2: Laptop Pro
(2, 3, '2023-11-02'),  -- ProductID 3: Wireless Headphones
(3, 4, '2023-11-03'),  -- ProductID 4: 4K Television
(4, 5, '2023-11-04'),  -- ProductID 5: Gaming Console
(5, 6, '2023-11-05'),  -- ProductID 6: Bluetooth Speaker
(6, 7, '2023-11-06'),  -- ProductID 7: Smartwatch Series 5
(7, 8, '2023-11-07'),  -- ProductID 8: DSLR Camera
(8, 9, '2023-11-08'),  -- ProductID 9: Wireless Mouse
(9, 10, '2023-11-09'), -- ProductID 10: Mechanical Keyboard
(10, 11, '2023-11-10'); -- ProductID 11: Smart Home Device

=================================================================
select * from Customers
select * from  Products
select * from  Categories
select * from  Orders
select * from  OrderDetails
select * from  Suppliers
select * from  Payments
select * from  Shipping
select * from  Inventory
select * from  Reviews
select * from  ShoppingCart
select * from  WishList

================================================================

--- 1. Find Top 5 Best-Selling Products (By Quantity Sold)

SELECT top 5 
    p.ProductName, 
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalSalesValue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC ; 

--- 2. Find Top 5 Customers by Total Spend

SELECT top 5 
    c.FirstName + ' ' + c.LastName AS CustomerName, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSpent
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC ;

--- 3. Find the Average Rating of Each Product

SELECT  p.ProductName,  AVG(r.Rating) AS AverageRating
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AverageRating DESC;

--- 4. Find the Top 5 Most-Added Products to Wishlist

SELECT 
    p.ProductName, 
    COUNT(w.ProductID) AS TimesAddedToWishlist
FROM WishList w
JOIN Products p ON w.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TimesAddedToWishlist DESC

--- 5. Compare Sales Before and After Discount on Products

SELECT 
    p.ProductName,
    SUM(CASE WHEN o.OrderDate < '2023-12-01' THEN od.Quantity * od.UnitPrice ELSE 0 END) AS SalesBeforeDiscount,
    SUM(CASE WHEN o.OrderDate >= '2023-12-01' THEN od.Quantity * od.UnitPrice ELSE 0 END) AS SalesAfterDiscount
FROM  OrderDetails od
JOIN  Orders o ON od.OrderID = o.OrderID
JOIN  Products p ON od.ProductID = p.ProductID
WHERE  p.ProductID IN (SELECT ProductID FROM Products WHERE Price < 100)
GROUP BY p.ProductName;

--- 6. Find Products with Low Sales Volume (Below a Threshold)

SELECT 
    p.ProductName, 
    SUM(od.Quantity) AS TotalQuantitySold
FROM  OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY  p.ProductName
HAVING  SUM(od.Quantity) < 10
ORDER BY TotalQuantitySold ASC;

--- 7. Find Total Sales by Region (City or Country) 

SELECT 
    c.City, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSalesValue
FROM  OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN  Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY TotalSalesValue DESC;

-- 8. Monthly Sales Analysis for the Past 12 Months 

SELECT 
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    SUM(od.Quantity * od.UnitPrice) AS MonthlySales
FROM  OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY  YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY  Year DESC, Month DESC;

--- 9 . Calculate Total Profit for Each Product (Profit Margin Analysis)

SELECT 
    p.ProductName, 
    SUM(od.Quantity * (od.UnitPrice - p.Price)) AS TotalProfit
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalProfit DESC;

---10. Find the total sales by region (city or country) to help with regional marketing efforts.

SELECT 
    c.City, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSalesValue
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY TotalSalesValue DESC;

--- 11. Calculate the total sales per month for the past 12 months

SELECT 
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    SUM(od.Quantity * od.UnitPrice) AS MonthlySales
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Year DESC, Month DESC;

---- 12. Calculate the total profit margin (Revenue - Cost) for each product.

SELECT 
    p.ProductName, 
    SUM(od.Quantity * (od.UnitPrice - p.Price)) AS TotalProfit
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalProfit DESC;

--- 13. Find total sales for each product in different seasons (Spring, Summer, Fall, Winter).

SELECT  
    p.ProductName,
    CASE 
        WHEN MONTH(o.OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(o.OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(o.OrderDate) IN (9, 10, 11) THEN 'Fall'
        WHEN MONTH(o.OrderDate) IN (12, 1, 2) THEN 'Winter'
    END AS Season,
    SUM(od.Quantity * od.UnitPrice) AS TotalSalesValue
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName, 
    CASE 
        WHEN MONTH(o.OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(o.OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(o.OrderDate) IN (9, 10, 11) THEN 'Fall'
        WHEN MONTH(o.OrderDate) IN (12, 1, 2) THEN 'Winter'
    END
ORDER BY  Season, TotalSalesValue DESC;

--- 14. Calculate the lifetime value of each customer (Total spend over time).

SELECT 
    c.CustomerID, 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    SUM(od.Quantity * od.UnitPrice) AS LifetimeValue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY LifetimeValue DESC;

--- 15. Find the products with the highest profit margins.

SELECT 
    p.ProductName,
    SUM(od.Quantity * (od.UnitPrice - p.Price)) AS TotalProfit
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    TotalProfit DESC;

--- 16. Correlate the price of products with the quantity sold

SELECT 
    p.ProductName, 
    p.Price,
    SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName, p.Price
ORDER BY Price DESC;

--- 17.Calculate the average rating and number of reviews for each product.

SELECT 
    p.ProductName, 
    AVG(r.Rating) AS AverageRating,
    COUNT(r.ReviewID) AS ReviewCount
FROM 
    Reviews r
JOIN 
    Products p ON r.ProductID = p.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    AverageRating DESC;

-- 18. Calculate the total profit for each product category.

SELECT 
    c.CategoryName,
    SUM(od.Quantity * (od.UnitPrice - p.Price)) AS TotalProfit
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryName
ORDER BY 
    TotalProfit DESC; 

============= Scanario based questions 

--- The marketing team wants to identify which products are the most popular in each season. Help them by generating a report that shows the top-selling products in each season (Spring, Summer, Fall, Winter), based on the total sales value.


SELECT  
    p.ProductName, 
    SUM(od.Quantity * od.UnitPrice) AS Total_Sales,  -- Assuming 'UnitPrice' is the column for price
    CASE 
        WHEN MONTH(o.OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(o.OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(o.OrderDate) IN (9, 10, 11) THEN 'Fall'
        WHEN MONTH(o.OrderDate) IN (12, 1, 2) THEN 'Winter'
    END AS Season
FROM OrderDetails od
JOIN  Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID  -- Added JOIN with Products table
GROUP BY p.ProductName, 
    CASE 
        WHEN MONTH(o.OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(o.OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(o.OrderDate) IN (9, 10, 11) THEN 'Fall'
        WHEN MONTH(o.OrderDate) IN (12, 1, 2) THEN 'Winter'
    END
ORDER BY  Season, Total_Sales DESC;  -- Order by season, then by total sales in descending order


--- You are tasked with calculating the Lifetime Value (LTV) of customers, which is the total revenue generated by each customer from their orders. Provide a query to calculate and rank customers by their LTV.

select c.customerid , c.firstname + ' ' + c.lastname as FullName ,
       sum(od.quantity * od.unitprice) as LifeTimeValue 
from orders o 
join orderdetails od on o.orderid = od.orderid 
join customers c on o.customerid = c.customerid 
group by c.customerid , c.firstname , c.lastname
order by LifetimeValue

---  The company wants to understand which product categories are generating the most sales. 
--   Provide a query to calculate the total sales for each category.

select * from categories 
select * from orderdetails 
select * from products 

select c.categoryname , sum(od.quantity * od.unitprice ) as TotalSales 
from orderdetails od 
join products p on od.productid = p.productid 
join categories c on p.categoryid = c.categoryid 
group by c.categoryname 
order by TotalSales desc 


--- The company wants to analyze customer satisfaction by reviewing the average ratings for each product. 
    Provide a query to calculate the average rating for each product.

select p.productname , avg(r.rating) as AvgRating 
from products p 
join reviews r on p.productid = r.productid 
group by p.productname 
order by AvgRating desc 


--








































