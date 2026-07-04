-- How many order records are available for analysis?
SELECT COUNT(*) AS Total_Orders
FROM amazon_sales;

-- View the data
SELECT *
FROM amazon_sales
LIMIT 15;

-- Date Range:What time period does this dataset cover?
SELECT 
MIN(OrderDate) AS First_Order,
MAX(OrderDate) AS Last_Order
FROM amazon_sales;

-- Check Order Status
SELECT distinct OrderStatus
FROM amazon_sales;

-- Payment Methods:What payment options do customers use?
SELECT distinct PaymentMethod
FROM amazon_sales;


