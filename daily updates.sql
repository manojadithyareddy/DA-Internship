# CREATE A DATABASE
CREATE DATABASE ZenithRetail;

# USE USING THE FETCH THE DATABASE

USE ZenithRetail;

#DELETE ENTIRE TABLE STRUCTURE AND DATA

drop database zenithretail;

#CREATE A NEW TABLE 

CREATE TABLE orders (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date VARCHAR(30),
    Ship_Date VARCHAR(30),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(30),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(30),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2)
);

#SELECT IS USING FETCH THE ENTIRE DATA IN COLUMNS

select * from ORDERS;

#Initial Data Audit(CHECK MISSING VALES)
#COUNT IS USING HOW MANY NULL VALUES PRESENT IN THE DATA

select count(*) AS Total_orderIDs
from ORDERS
where Order_ID IS NULL
	OR TRIM(ORDER_ID) = '';

SELECT COUNT(*) AS TOTAL_SALESVALUE
FROM ORDERS
WHERE SALES IS NULL
	or TRIM(ORDER_ID) = '';

# LIMIT IS RETRIVE THE 5 ROWS LIMITS
SELECT *
FROM ORDERS
LIMIT 5;

#OFFSET IS USING FIRST 5 SKIPS

select *
from orders
limit 5 offset 5;

SELECT *
FROM ORDERS
WHERE PRODUCT_ID IS NULL
	OR CUSTOMER_ID IS NULL;
    
SELECT COUNT(*) FROM ORDERS
WHERE PRODUCT_ID IS NULL
	OR TRIM(PRODUCT_ID) = '';
    
SELECT COUNT(*) FROM ORDERS
WHERE CUSTOMER_ID IS NULL
	OR TRIM(CUSTOMER_ID) = '';
    
SELECT *
FROM orders
WHERE Product_ID IS NULL
   OR TRIM(Product_ID) = ''
   OR Customer_ID IS NULL
   OR TRIM(Customer_ID) = '';
   
# SAFE MODE IS THE SAFETY FEATURE THAT PREVENTS ACCIDENTAL UPDATES OR DELETES OF LARGE AMOUNTS OF DATA. 
SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET Product_ID = 'UNKNOWN'
WHERE Product_ID IS NULL
   OR TRIM(Product_ID) = '';

UPDATE ORDERS
SET CUSTOMER_ID = 'UNKNOWN'
WHERE CUSTOMER_ID IS NULL
	OR TRIM(CUSTOMER_ID) = '';
    
SET SQL_SAFE_UPDATES = 1;

SELECT COUNT(*)
FROM ORDERS
WHERE PRODUCT_ID IS NULL
	OR TRIM(PRODUCT_ID) = '';
    
SELECT COUNT(*)
FROM ORDERS
WHERE PRODUCT_ID IS NULL
	OR TRIM(PRODUCT_ID) = '';
    
SELECT * FROM ORDERS;

#STANDARDIZE (DUPLICATES PREVENT)
SELECT DISTINCT CATEGORY
FROM ORDERS
ORDER BY CATEGORY;

SELECT DISTINCT Sub_Category
FROM ORDERS
ORDER BY Sub_Category;

SELECT CATEGORY,COUNT(*)
FROM ORDERS
GROUP BY CATEGORY
ORDER BY CATEGORY;

SELECT SUB_CATEGORY,COUNT(*)
FROM ORDERS
GROUP BY SUB_CATEGORY
ORDER BY SUB_CATEGORY;

SET SQL_SAFE_UPDATES = 0;

UPDATE ORDERS
SET CATEGORY = 'Furniture'
WHERE LOWER(TRIM(CATEGORY)) = 'furniture';

UPDATE ORDERS
SET CATEGORY = 'Office Supplies'
WHERE LOWER(TRIM(CATEGORY)) = 'office supplies';

UPDATE ORDERS
SET CATEGORY = 'Technology'
WHERE LOWER(TRIM(CATEGORY)) = 'technology';

UPDATE orders
SET Category = TRIM(Category),
    Sub_Category = TRIM(Sub_Category);
    

SET SQL_SAFE_UPDATES = 1;

SELECT distinct CATEGORY
FROM ORDERS;

SELECT * FROM ORDERS;

SELECT Order_Date,Ship_Date
FROM ORDERS
LIMIT 10;

# CONVERT INTO STRING FORMAT IN DATES
SELECT *
FROM orders
WHERE str_to_date(order_date,'%d%m%Y') IS NULL;

SELECT *
FROM orders
WHERE str_to_date(SHIP_date,'%d%m%Y') IS NULL;

ALTER TABLE orders
ADD COLUMN Order_Date_latest DATE,
ADD COLUMN Ship_Date_latest DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET Order_Date_latest = STR_TO_DATE(Order_Date, '%d/%m/%Y'),
    Ship_Date_latest  = STR_TO_DATE(Ship_Date, '%d/%m/%Y');

SET SQL_safe_updates = 1;

SELECT Order_Date,
	   Order_date_latest,
       Ship_Date,
       Ship_date_latest
FROM orders
LIMIT 10;

SELECT *
FROM orders
WHERE Ship_Date_latest < Order_Date_latest;

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
