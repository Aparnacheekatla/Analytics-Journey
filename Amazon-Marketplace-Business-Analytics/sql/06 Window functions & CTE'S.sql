/*
ADVANCED SQL ANALYSIS
Amazon Marketplace Business Analytics
*/

/*1. Rank Highest Revenue Orders
Business Question:
Which orders generated the highest revenue?

Business Case:
Identify premium transactions.

Why this query?
Ranks orders by TotalAmount.
*/

SELECT
OrderID,
CustomerName,
TotalAmount,
RANK() OVER(ORDER BY TotalAmount DESC) AS RevenueRank
FROM amazon_sales;

/* 2. Dense Rank Customers */
SELECT
CustomerName,
TotalAmount,
DENSE_RANK() OVER(ORDER BY TotalAmount DESC) AS CustomerRank
FROM amazon_sales;

/* 3. Row Number */
SELECT
OrderID,
CustomerName,
TotalAmount,
ROW_NUMBER() OVER(ORDER BY OrderDate) AS RowNum
FROM amazon_sales;

/* 4. Top Product in Every Category */
WITH CategoryRank AS
(
SELECT
Category,
ProductName,
SUM(TotalAmount) AS Revenue,
ROW_NUMBER() OVER
(
PARTITION BY Category
ORDER BY SUM(TotalAmount) DESC
) AS rn
FROM amazon_sales
GROUP BY Category, ProductName
)

SELECT *
FROM CategoryRank
WHERE rn=1;

/* 5. Top Customer in Every State */
WITH CustomerRank AS
(
SELECT
State,
CustomerName,
SUM(TotalAmount) AS Revenue,
ROW_NUMBER() OVER
(
PARTITION BY State
ORDER BY SUM(TotalAmount) DESC
) rn
FROM amazon_sales
GROUP BY State, CustomerName
)

SELECT *
FROM CustomerRank
WHERE rn=1;

/* 6. Running Revenue */
SELECT
OrderDate,
TotalAmount,
SUM(TotalAmount)
OVER(ORDER BY OrderDate)
AS RunningRevenue
FROM amazon_sales;

/* 7. Previous Order Amount (LAG) */
SELECT
OrderDate,
TotalAmount,
LAG(TotalAmount)
OVER(ORDER BY OrderDate)
AS PreviousOrder
FROM amazon_sales;

/* 8. Next Order Amount (LEAD) */
SELECT
OrderDate,
TotalAmount,
LEAD(TotalAmount)
OVER(ORDER BY OrderDate)
AS NextOrder
FROM amazon_sales;

/* 9. Revenue Contribution % */
SELECT
Category,
SUM(TotalAmount) AS Revenue,
ROUND
(
SUM(TotalAmount)*100/
SUM(SUM(TotalAmount)) OVER(),
2
) AS RevenuePercent
FROM amazon_sales
GROUP BY Category
ORDER BY Revenue DESC;

/* 10. Monthly Running Revenue */
SELECT
YEAR(OrderDate) AS OrderYear,
MONTH(OrderDate) AS OrderMonth,
SUM(TotalAmount) AS Revenue,

SUM(SUM(TotalAmount))
OVER
(
ORDER BY YEAR(OrderDate),
MONTH(OrderDate)
) AS RunningRevenue

FROM amazon_sales

GROUP BY
YEAR(OrderDate),
MONTH(OrderDate)

ORDER BY
OrderYear,
OrderMonth;

/* 11. Highest Order per Customer */
WITH CustomerOrders AS
(
SELECT
CustomerID,
CustomerName,
OrderID,
TotalAmount,

ROW_NUMBER()
OVER
(
PARTITION BY CustomerID
ORDER BY TotalAmount DESC
) rn

FROM amazon_sales
)

SELECT *
FROM CustomerOrders
WHERE rn=1;

/* 12. Revenue Ranking by Brand */
SELECT
Brand,

SUM(TotalAmount) AS Revenue,

RANK()
OVER
(
ORDER BY SUM(TotalAmount) DESC
) BrandRank

FROM amazon_sales

GROUP BY Brand;

/* 13. Average Revenue by Category */
SELECT
Category,

SUM(TotalAmount) AS Revenue,

AVG(SUM(TotalAmount))
OVER()
AS AverageCategoryRevenue

FROM amazon_sales

GROUP BY Category;

/* 14. Top 5 Products Overall */
SELECT
ProductName,

SUM(TotalAmount) AS Revenue,

DENSE_RANK()
OVER
(
ORDER BY SUM(TotalAmount) DESC
) ProductRank

FROM amazon_sales

GROUP BY ProductName;

/* 15. CTE Example */
WITH RevenueByCategory AS
(
SELECT
Category,
SUM(TotalAmount) Revenue
FROM amazon_sales
GROUP BY Category
)

SELECT *
FROM RevenueByCategory
WHERE Revenue >
(
SELECT AVG(Revenue)
FROM RevenueByCategory
);