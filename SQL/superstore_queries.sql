-- ============================================================
-- Superstore Sales Data Analysis and Reporting System
-- SQL Queries
-- Database: superstore_project
-- Table: superstore_db_clean
-- ============================================================

-- View all tables in the schema
SHOW TABLES;

-- ------------------------------------------------------------
-- 1. Basic Summary Metrics
-- ------------------------------------------------------------

-- Total Sales
SELECT SUM(`Sales Amount`) AS Total_Sales
FROM superstore_db_clean;

-- Total Profit
SELECT ROUND(SUM(profit), 2) AS Total_Profit
FROM superstore_db_clean;

-- Total Quantity Sold
SELECT SUM(`Quantity Sold`) AS Total_Quantity_Sold
FROM superstore_db_clean;

-- Number of Orders
SELECT COUNT(`Order ID`) AS Number_Of_Orders
FROM superstore_db_clean;

-- Average Order Value
SELECT ROUND(SUM(`Sales Amount`) / COUNT(`Order ID`), 2) AS Average_Order_Value
FROM superstore_db_clean;

-- Profit Margin Percentage
SELECT ROUND(SUM(profit) / SUM(`Sales Amount`) * 100, 2) AS Profit_Margin_Percent
FROM superstore_db_clean;

-- ------------------------------------------------------------
-- 2. Top 5 Customers by Total Spend
-- ------------------------------------------------------------

SELECT `Customer Name`, ROUND(SUM(`Sales Amount`), 2) AS Total_Spent
FROM superstore_db_clean
GROUP BY `Customer Name`
ORDER BY Total_Spent DESC
LIMIT 5;

-- ------------------------------------------------------------
-- 3. Top 5 Products by Quantity Sold
-- ------------------------------------------------------------

SELECT `Product Name`, ROUND(SUM(`Quantity Sold`), 2) AS Total_Unit_Sold
FROM superstore_db_clean
GROUP BY `Product Name`
ORDER BY Total_Unit_Sold DESC
LIMIT 5;

-- ------------------------------------------------------------
-- 4. Total Sales by Region and Product Category
-- ------------------------------------------------------------

SELECT Region, `Product Category`, ROUND(SUM(`Sales Amount`), 2) AS Total_Sales
FROM superstore_db_clean
GROUP BY Region, `Product Category`
ORDER BY Region, Total_Sales DESC;

-- ------------------------------------------------------------
-- 5. Top 5 Sales Representatives in the Technology Category
-- ------------------------------------------------------------

SELECT `Sales Representative`, ROUND(SUM(`Sales Amount`), 2) AS Tech_Sales
FROM superstore_db_clean
WHERE `Product Category` = 'Technology'
GROUP BY `Sales Representative`
ORDER BY Tech_Sales DESC
LIMIT 5;
