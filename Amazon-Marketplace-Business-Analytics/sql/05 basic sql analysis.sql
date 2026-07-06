
/*Business Question 1:
How many orders exist in the marketplace?

Business Case:
Business leaders monitor total order volume to understand
overall marketplace activity.

Why this query?
Returns the total number of marketplace transactions.*/

SELECT COUNT(*) AS Total_Orders
FROM amazon_sales;

/*
Business Question 2:
What does the dataset look like?

Business Case:
Analysts review sample records before beginning analysis.

Why this query?
Displays the first 10 transactions.
*/
SELECT *
FROM amazon_sales
LIMIT 10;

/*
Business Question 3:
Which orders have been delivered?

Business Case:
Operations teams monitor successfully completed orders.

Why this query?
Filters only delivered orders.
*/
SELECT *
FROM amazon_sales
WHERE OrderStatus = 'Delivered';
/*
Business Question 4:
Which orders were cancelled?

Business Case:
Cancelled orders impact customer satisfaction and revenue.

Why this query?
Retrieves cancelled transactions.
*/

SELECT *
FROM amazon_sales
WHERE OrderStatus = 'Cancelled';

/*
                BASIC SQL ANALYSIS
          Amazon Marketplace Business Analytics
*/


/*
Business Question 1:
How many orders exist in the marketplace?

Business Case:
Business leaders monitor total order volume to understand
overall marketplace activity.

Why this query?
Returns the total number of marketplace transactions.
*/

SELECT COUNT(*) AS Total_Orders
FROM amazon_sales;


/*
Business Question 2:
What does the dataset look like?

Business Case:
Analysts review sample records before beginning analysis.

Why this query?
Displays the first 10 transactions.
*/

SELECT *
FROM amazon_sales
LIMIT 10;


/*
Business Question 3:
Which orders have been delivered?

Business Case:
Operations teams monitor successfully completed orders.

Why this query?
Filters only delivered orders.
*/

SELECT *
FROM amazon_sales
WHERE OrderStatus = 'Delivered';


/*
Business Question 4:
Which orders were cancelled?

Business Case:
Cancelled orders impact customer satisfaction and revenue.

Why this query?
Retrieves cancelled transactions.
*/

SELECT *
FROM amazon_sales
WHERE OrderStatus = 'Cancelled';


/*
Business Question 5:
Which orders belong to the Electronics category?

Business Case:
Category-level analysis helps evaluate product performance.

Why this query?
Filters orders for Electronics.
*/

SELECT *
FROM amazon_sales
WHERE Category = 'Electronics';


/*
Business Question 6:
Which customers paid using Credit Card?

Business Case:
Understanding payment preferences supports payment strategy.

Why this query?
Filters transactions by payment method.
*/

SELECT *
FROM amazon_sales
WHERE PaymentMethod = 'Credit Card';


/*
Business Question 7:
Which orders were placed in the United States?

Business Case:
Regional analysis helps identify key markets.

Why this query?
Returns all US marketplace orders.
*/

SELECT *
FROM amazon_sales
WHERE Country = 'United States';


/*
Business Question 8:
Which orders generated the highest revenue?

Business Case:
High-value orders identify premium customers and products.

Why this query?
Sorts orders by TotalAmount.
*/

SELECT
OrderID,
CustomerName,
Category,
TotalAmount
FROM amazon_sales
ORDER BY TotalAmount DESC
LIMIT 10;


/*
Business Question 9:
Which orders generated the lowest revenue?

Business Case:
Low-value transactions may indicate pricing or discount issues.

Why this query?
Finds the smallest transactions.
*/

SELECT
OrderID,
CustomerName,
Category,
TotalAmount
FROM amazon_sales
ORDER BY TotalAmount ASC
LIMIT 10;


/*
Business Question 10:
Which customers purchased more than one item?

Business Case:
Higher quantity purchases indicate bulk buying behavior.

Why this query?
Filters orders with Quantity greater than one.
*/

SELECT
OrderID,
CustomerName,
Quantity,
TotalAmount
FROM amazon_sales
WHERE Quantity > 1;


/*
Business Question 11:
Which products belong to the Fashion category?

Business Case:
Allows category-specific product analysis.

Why this query?
Filters Fashion products.
*/

SELECT
ProductName,
Brand,
Category,
TotalAmount
FROM amazon_sales
WHERE Category = 'Fashion';


/*
Business Question 12:
Show orders sorted by newest first.

Business Case:
Analysts frequently review the latest transactions.

Why this query?
Sorts orders by date.
*/

SELECT
OrderID,
OrderDate,
CustomerName,
TotalAmount
FROM amazon_sales
ORDER BY OrderDate DESC;


/*
Business Question 13:
Which products cost more than $500?

Business Case:
Identifies premium-priced products.

Why this query?
Filters high-priced products.
*/

SELECT
ProductName,
Brand,
UnitPrice
FROM amazon_sales
WHERE UnitPrice > 500;


/*
Business Question 14:
Show unique payment methods.

Business Case:
Business teams need to understand supported payment options.

Why this query?
Returns distinct payment methods.
*/

SELECT DISTINCT PaymentMethod
FROM amazon_sales;


/*
Business Question 15:
Show unique product categories.

Business Case:
Provides an overview of marketplace offerings.

Why this query?
Returns distinct product categories.
*/

SELECT DISTINCT Category
FROM amazon_sales;