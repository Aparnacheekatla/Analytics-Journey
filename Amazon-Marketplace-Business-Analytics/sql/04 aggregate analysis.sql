/*
AGGREGATE ANALYSIS
Amazon Marketplace Business Analytics
*/
 
/*TOTAL REVENUE
Business Question:
How much revenue has the marketplace generated?

Business Case:
Revenue is the primary KPI used to measure business performance.

Why this query?
Calculates total sales revenue.
*/
SELECT
SUM(TotalAmount) AS TotalRevenue
FROM amazon_sales;

/*2. AVG ORDER VALUE
Business Question:
What is the average order value?

Business Case:
Measures average customer spending.
*/

SELECT
AVG(TotalAmount) AS AverageOrderValue
FROM amazon_sales;

/*3. REVENUE BY CATEGORY
Business Question:
Which product categories generate the highest revenue?

Business Case:
Helps prioritize inventory and marketing investments.
*/
SELECT
Category,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY Category
ORDER BY Revenue DESC;

/* 4. Revenue by Brand */
SELECT
Brand,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY Brand
ORDER BY Revenue DESC;

/* 5. Revenue by State */
SELECT
State,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY State
ORDER BY Revenue DESC;

/* 6. Revenue by Country */
SELECT
Country,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY Country
ORDER BY Revenue DESC;

/* 7. Revenue by Payment Method */
SELECT
PaymentMethod,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

/* 8. Orders by Status */
SELECT
OrderStatus,
COUNT(*) AS Orders
FROM amazon_sales
GROUP BY OrderStatus
ORDER BY Orders DESC;

/* 9. Average Order Value by Category */
SELECT
Category,
AVG(TotalAmount) AS AvgOrderValue
FROM amazon_sales
GROUP BY Category
ORDER BY AvgOrderValue DESC;

/* 10. Average Quantity Purchased. */
SELECT
Category,
AVG(Quantity) AS AverageQuantity
FROM amazon_sales
GROUP BY Category
ORDER BY AverageQuantity DESC;

/* 11. Top 10 Customers */
SELECT
CustomerName,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY CustomerName
ORDER BY Revenue DESC
LIMIT 10;

/* 12. Top 10 Sellers */
SELECT
SellerID,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY SellerID
ORDER BY Revenue DESC
LIMIT 10;

/* 13. Top Cities */
SELECT
City,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY City
ORDER BY Revenue DESC
LIMIT 10;

/* 14. Highest Tax by Category */
SELECT
Category,
SUM(Tax) AS TotalTax
FROM amazon_sales
GROUP BY Category
ORDER BY TotalTax DESC;

/* 15. Shipping Cost by Category */
SELECT
Category,
SUM(ShippingCost) AS ShippingCost
FROM amazon_sales
GROUP BY Category
ORDER BY ShippingCost DESC;

/* 16. Discount by Category */
SELECT
Category,
AVG(Discount) AS AverageDiscount
FROM amazon_sales
GROUP BY Category
ORDER BY AverageDiscount DESC;

/* 17. Highest Revenue Products */
SELECT
ProductName,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 10;

/* 18. Revenue by Year */
SELECT
YEAR(OrderDate) AS OrderYear,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

/* 19. Revenue by Month */
SELECT
MONTHNAME(OrderDate) AS Month,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY MONTH(OrderDate), MONTHNAME(OrderDate)
ORDER BY MONTH(OrderDate);

/* 20. Categories with Revenue Above 1 Million (HAVING) */
SELECT
Category,
SUM(TotalAmount) AS Revenue
FROM amazon_sales
GROUP BY Category
HAVING Revenue > 1000000
ORDER BY Revenue DESC;