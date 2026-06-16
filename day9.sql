SELECT * FROM ORDERS;

SELECT DISTINCT REGION
FROM ORDERS;
CREATE TABLE regional_data (
    Region VARCHAR(50),
    Regional_Manager VARCHAR(100),
    Zone VARCHAR(50)
);
SELECT
    o.Order_ID,
    o.Customer_ID,
    o.Customer_Name,
    o.Region,
    r.Regional_Manager,
    r.Zone,
    o.Category,
    o.Sub_Category,
    o.Sales,
    o.Profit
FROM orders o
LEFT JOIN regional_data r
    ON o.Region = r.Region;
    
SELECT o.Region,r.Region
FROM orders o
LEFT JOIN regional_data r
    ON o.Region = r.Region
WHERE r.Region IS NULL;

CREATE OR REPLACE VIEW vw_sales_performance AS
SELECT
    Order_ID,
    Order_Date_latest AS Order_Date,
    Ship_Date_latest AS Ship_Date,
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Region,
    Category,
    Sub_Category,
    Product_ID,
    Product_Name,
    Sales,
    Quantity,
    Discount,
    Profit
FROM orders;

CREATE OR REPLACE VIEW vw_region_summary AS
SELECT
    Region,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales),0)) * 100,
        2
    ) AS Profit_Margin_Pct
FROM orders
GROUP BY Region;

SELECT *
FROM vw_sales_performance
LIMIT 10;