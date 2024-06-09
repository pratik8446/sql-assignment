-- Create the database
CREATE DATABASE sales_db;
USE sales_db;

-- Create the table
CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    ProductCategory VARCHAR(255),
    CustomerSegment VARCHAR(255),
    Sales DECIMAL(10, 2),
    Discount DECIMAL(5, 2)
);
-- secure-file-priv="C:\Users\acer\OneDrive\Desktop\Python With Database\Python Programming\LnB\Assignments\sales_data.csv"
SELECT @@GLOBAL.secure_file_priv;

-- Import the CSV data (adjust the path to your CSV file)
LOAD DATA INFILE 'C:\Users\acer\OneDrive\Desktop\Python With Database\Python Programming\LnB\Assignments\sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Query to retrieve total sales and average discount
SELECT
    ProductCategory,
    CustomerSegment,
    SUM(Sales) AS TotalSales,
    AVG(Discount) AS AverageDiscount
FROM
    sales_data
GROUP BY
    ProductCategory,
    CustomerSegment;
    
    
    CREATE TABLE product_details (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    ProductDescription TEXT
);

-- Create the sales_data table (if not already created)
CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    ProductCategory VARCHAR(255),
    CustomerSegment VARCHAR(255),
    Sales DECIMAL(10, 2),
    Discount DECIMAL(5, 2),
    ProductID INT
);

-- Insert dummy data into sales_data table
INSERT INTO sales_data (OrderID, ProductCategory, CustomerSegment, Sales, Discount, ProductID)
VALUES
(1, 'Electronics', 'Consumer', 1000.00, 10.00, 1),
(2, 'Electronics', 'Business', 1500.00, 15.00, 2),
(3, 'Home', 'Consumer', 2000.00, 20.00, 3);

-- Create the product_details table
CREATE TABLE product_details (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    ProductDescription TEXT
);

-- Insert dummy data into product_details table
INSERT INTO product_details (ProductID, ProductName, ProductDescription)
VALUES
(1, 'Product A', 'Description for Product A'),
(2, 'Product B', 'Description for Product B'),
(3, 'Product C', 'Description for Product C');

-- Perform the join query
SELECT
    sd.OrderID,
    sd.ProductCategory,
    sd.CustomerSegment,
    sd.Sales,
    sd.Discount,
    pd.ProductName,
    pd.ProductDescription
FROM
    sales_data sd
JOIN
    product_details pd ON sd.ProductID = pd.ProductID;





