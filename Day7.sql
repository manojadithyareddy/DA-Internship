SELECT
    Order_ID,
    Ship_Mode,
    Order_Date_latest,
    Ship_Date_latest,
    DATEDIFF(Ship_Date_latest, Order_Date_latest) AS Shipping_Delay_Days
FROM orders;

SELECT
    Ship_Mode,
    ROUND(AVG(DATEDIFF(Ship_Date_latest, Order_Date_latest)),2) AS Avg_Delay_Days
FROM orders
GROUP BY Ship_Mode
ORDER BY Avg_Delay_Days;

SELECT
    Ship_Mode,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(DATEDIFF(Ship_Date_latest, Order_Date_latest)),2) AS Avg_Delay_Days,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Ship_Mode
ORDER BY Avg_Delay_Days;

SELECT
    Ship_Mode,
    ROUND(AVG(DATEDIFF(Ship_Date_latest, Order_Date_latest)),2) AS Avg_Delay_Days,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Pct
FROM orders
GROUP BY Ship_Mode
ORDER BY Avg_Delay_Days;

SELECT
    Ship_Mode,
    COUNT(*) AS Orders_Count,
    ROUND(AVG(DATEDIFF(Ship_Date_latest, Order_Date_latest)),2) AS Avg_Delay_Days,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Pct,
    DENSE_RANK() OVER(
        ORDER BY ROUND((SUM(Profit)/SUM(Sales))*100,2) DESC
    ) AS Performance_Rank
FROM orders
GROUP BY Ship_Mode;