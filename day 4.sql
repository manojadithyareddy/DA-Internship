SELECT * FROM ORDERS;
DESCRIBE orders;
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders;

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

SELECT
    Category,
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category, Sub_Category
ORDER BY Category, Total_Sales DESC;

SELECT
    SUM(Sales) AS Grand_Total_Sales,
    SUM(Profit) AS Grand_Total_Profit
FROM orders;

SELECT
    SUM(Category_Sales) AS Check_Total_Sales,
    SUM(Category_Profit) AS Check_Total_Profit
FROM
(
    SELECT
        SUM(Sales) AS Category_Sales,
        SUM(Profit) AS Category_Profit
    FROM orders
    GROUP BY Category
) AS category_totals;

SELECT
    Category,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY Category;

SELECT
    Category,
    AVG(Sales) AS Avg_Sales,
    AVG(Profit) AS Avg_Profit
FROM orders
GROUP BY Category;