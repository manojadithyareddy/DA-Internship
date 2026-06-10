CREATE DATABASE ZenithRetail;
USE ZenithRetail;
drop database zenithretail;
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

select * from ORDERS;

select count(*) AS Total_orderIDs
from ORDERS
where Order_ID IS NULL
	OR TRIM(ORDER_ID) = '';

SELECT COUNT(*) AS TOTAL_SALESVALUE
FROM ORDERS
WHERE SALES IS NULL;

SELECT *
FROM ORDERS
LIMIT 5;

select *
from orders
limit 5 offset 5;


WHERE Ship_Date_latest < Order_Date_latest;

