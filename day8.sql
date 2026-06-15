SELECT COUNT(*) AS Missing_CustomerID
FROM orders
WHERE Customer_ID IS NULL
   OR TRIM(Customer_ID) = '';
   
SELECT COUNT(*) AS Missing_Sales
FROM orders
WHERE Sales IS NULL;

SELECT
    Customer_ID,
    Order_ID,
    COUNT(*) AS Cnt
FROM orders
GROUP BY Customer_ID, Order_ID
HAVING COUNT(*) > 1;

SELECT count(*)
FROM orders
WHERE Sales < 0;

SELECT count(*)
FROM orders
WHERE Order_Date_latest IS NULL;

SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales
FROM orders;

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    AVG(Sales) AS Avg_Order_Value,
    MIN(Order_Date_latest) AS First_Order_Date,
    MAX(Order_Date_latest) AS Last_Order_Date
FROM orders
GROUP BY Customer_ID, Customer_Name;