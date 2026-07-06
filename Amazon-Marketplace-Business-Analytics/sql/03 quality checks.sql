-- Data Quality Assessment
-- Can we trust this data?

/*Imagine answering this question to leadership:

"Can we trust these sales numbers?"

Before calculating revenue or dashboards, you should be able to say:

No duplicate orders
No missing customer names
No negative prices
No invalid discounts
Data passed quality checks
*/

-- Check 1: Duplicate Orders:Is every OrderID unique?
SELECT OrderID,
	COUNT(*) AS Duplicate_OrderID
FROM amazon_sales
GROUP BY OrderID
HAVING COUNT(*) >1;

-- Check 2: Missing Values
SELECT *
FROM amazon_sales
WHERE CustomerName IS NULL;

-- Check 3: Negative Prices
SELECT *
FROM amazon_sales
WHERE UnitPrice < 0;

-- Check 4: Invalid Quantities
SELECT *
FROM amazon_sales
WHERE Quantity <= 0;

-- Check 5: Invalid Discounts
SELECT *
FROM amazon_sales
WHERE Discount < 0
OR Discount > 1;
   
-- Check 6: Negative Shipping Cost
SELECT *
FROM amazon_sales
WHERE ShippingCost < 0;

-- Check 7: Negative Tax
SELECT *
FROM amazon_sales
WHERE Tax < 0;

-- Check 8: Order Status Distribution
SELECT
OrderStatus,
COUNT(*) AS TotalOrders
FROM amazon_sales
GROUP BY OrderStatus
ORDER BY TotalOrders DESC;