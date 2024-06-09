CREATE TABLE MonthlySales (
    MonthYear DATE PRIMARY KEY,
    TotalSales DECIMAL(10, 2)
    );
    
    INSERT INTO MonthlySales (MonthYear, TotalSales)
SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS MonthYear,
       SUM(sales) AS TotalSales
FROM sales_data
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01');

SELECT
    current_month.MonthYear AS CurrentMonth,
    current_month.TotalSales AS CurrentSales,
    previous_month.TotalSales AS PreviousSales,
    (current_month.TotalSales - previous_month.TotalSales) / previous_month.TotalSales AS GrowthRate
FROM
    MonthlySales AS current_month
JOIN
    MonthlySales AS previous_month
ON
    current_month.MonthYear = DATE_SUB(previous_month.MonthYear, INTERVAL 1 MONTH);
    
    
SELECT 
    customer_name,
    SUM(sales) AS TotalSales,
    AVG(discount) AS AverageDiscount
FROM 
    sales_data
GROUP BY 
    customer_name
ORDER BY 
    TotalSales DESC
LIMIT 10;

SELECT 
    product_category,
    SUM(sales) AS TotalSales,
    AVG(discount) AS AverageDiscount
FROM 
    sales_data
GROUP BY 
    product_category;

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS Month,
    SUM(sales) AS TotalSales
FROM 
    sales_data
GROUP BY 
    Month
ORDER BY 
    TotalSales DESC
LIMIT 1;

SELECT 
    customer_name,
    MAX(sales) AS HighestPurchase
FROM 
    sales_data
GROUP BY 
    customer_name
ORDER BY 
    HighestPurchase DESC
LIMIT 10;

