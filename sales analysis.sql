CREATE DATABASE superstore_sales;
USE superstore_sales;
SELECT * FROM superstore_sales LIMIT 10;

SHOW TABLES;
USE superstore_sales;
SELECT * FROM `sample - superstore` LIMIT 10;
SELECT COUNT(*) FROM `sample - superstore`;
RENAME TABLE `sample - superstore` TO superstore;
DESCRIBE superstore;
-- Total of sales and profit
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore;
-- total sales categorical wise
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;
-- region wise profit
SELECT 
    Region,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;
-- top 10 sales 
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
-- least profit making products
SELECT 
    `Product Name`,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 5;
-- the average profit and total sales and total orders against each product
SELECT 
    `Product Name`,
    Discount,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM superstore
GROUP BY `Product Name`, Discount
ORDER BY Discount, Avg_Profit ASC;
-- sales year and month wise
SELECT 
    YEAR(`Order Date`) AS Year,
    MONTH(`Order Date`) AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Year, Month
ORDER BY Year, Month;
-- sales according to ship mode
SELECT 
    `Ship Mode`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM superstore
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;
-- top 5 sales by states
SELECT 
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 5;
--  Profit Margin by Sub-Category
SELECT 
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Profit_Margin_Percent DESC;