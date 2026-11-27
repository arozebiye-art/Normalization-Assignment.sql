
USE sales;

-- QUESTION 1: FIRST NORMAL FORM (1NF)

DROP TABLE IF EXISTS ProductDetail_1NF;

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'Mary Wanjiku', 'Laptop'),
(101, 'Mary Wanjiku', 'Mouse'),
(102, 'Brian Otieno', 'Tablet'),
(102, 'Brian Otieno', 'Keyboard'),
(102, 'Brian Otieno', 'Mouse'),
(103, 'Grace Achieng', 'Phone');

SELECT * FROM ProductDetail_1NF;


-- QUESTION 2: SECOND NORMAL FORM (2NF)

DROP TABLE IF EXISTS OrderItems_2NF;
DROP TABLE IF EXISTS Orders_2NF;

CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderItems_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

INSERT INTO Orders_2NF (OrderID, CustomerName)
VALUES
(101, 'Mary Wanjiku'),
(102, 'Brian Otieno'),
(103, 'Grace Achieng');

INSERT INTO OrderItems_2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

SELECT * FROM Orders_2NF;

SELECT * FROM OrderItems_2NF;

SELECT
    o.OrderID,
    o.CustomerName,
    i.Product,
    i.Quantity
FROM Orders_2NF o
INNER JOIN OrderItems_2NF i
ON o.OrderID = i.OrderID
ORDER BY o.OrderID;
