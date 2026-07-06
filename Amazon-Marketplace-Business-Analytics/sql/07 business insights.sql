/*
BUSINESS INSIGHTS
Amazon Marketplace Business Analytics
*/
/*
Business Question 1:
Which product categories generate the highest revenue?

Business Case:
Identify high-performing categories for inventory planning
and marketing investment.

*/

SELECT
Category,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY Category
ORDER BY Revenue DESC;
/*
Business Question 2:
Which brands contribute the most revenue?

Business Case:
Identify strategic brand partnerships and best sellers.

*/

SELECT
Brand,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY Brand
ORDER BY Revenue DESC;
/*
Business Question 3:
Which states generate the highest marketplace revenue?

Business Case:
Support regional marketing and expansion strategies.

*/

SELECT
State,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY State
ORDER BY Revenue DESC;
/*
Business Question 4:
Which payment methods are most preferred by customers?

Business Case:
Understand customer payment preferences to improve the
checkout experience.

*/

SELECT
PaymentMethod,
COUNT(*) AS TotalOrders
FROM amazon_sales
GROUP BY PaymentMethod
ORDER BY TotalOrders DESC;
/*
Business Question 5:
Who are the highest-value customers?

Business Case:
Identify customers for loyalty and retention programs.

*/

SELECT
CustomerName,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY CustomerName
ORDER BY Revenue DESC
LIMIT 10;
/*
Business Question 6:
What is the monthly revenue trend?

Business Case:
Identify seasonality and support sales forecasting.

*/

SELECT
YEAR(OrderDate) AS OrderYear,
MONTHNAME(OrderDate) AS OrderMonth,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY YEAR(OrderDate),
MONTH(OrderDate),
MONTHNAME(OrderDate)
ORDER BY YEAR(OrderDate),
MONTH(OrderDate);

/*
Business Question 7:
What is the distribution of order statuses?

Business Case:
Monitor operational efficiency and fulfillment performance.

*/

SELECT
OrderStatus,
COUNT(*) AS Orders
FROM amazon_sales
GROUP BY OrderStatus
ORDER BY Orders DESC;
/*
Business Question 8:
Which products generate the highest revenue?

Business Case:
Identify top-performing products for promotion and inventory.

*/

SELECT
ProductName,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 10;
/*
Business Question 9:
Which sellers contribute the highest revenue?

Business Case:
Recognize high-performing sellers and strengthen partnerships.

*/

SELECT
SellerID,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY SellerID
ORDER BY Revenue DESC
LIMIT 10;
/*
Business Question 10:
Which categories receive the highest average discount?

Business Case:
Evaluate pricing strategy and promotional effectiveness.

*/

SELECT
Category,
AVG(Discount) AS AverageDiscount
FROM amazon_sales
GROUP BY Category
ORDER BY AverageDiscount DESC;
/*
Project Summary

Key Areas Analyzed

Sales Performance
Customer Behavior
Product Performance
Seller Performance
Geographic Analysis
Payment Trends
Operational Performance
Revenue Trends

Next Phase

Executive Dashboard using Tableau

*/