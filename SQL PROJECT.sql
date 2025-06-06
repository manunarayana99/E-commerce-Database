CREATE DATABASE ONLINE_SHOPDB;
USE ONLINE_SHOPDB;



--  1. Database Design & Table Creation (DDL)
-- 1 ) Create all necessary tables using appropriate data types and constraints.
-- 2) Define primary and foreign keys to establish relationships.
-- 3) Add constraints like NOT NULL, UNIQUE, DEFAULT, CHECK.


-- USERS TABLE
CREATE TABLE USERS (
    USERID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(150),
    EMAIL VARCHAR(100) UNIQUE,
    PASSWORDHASH VARCHAR(255),
    PHONENUMBER VARCHAR(15),
    CREATEDAT DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- CATEGORIES TABLE
CREATE TABLE CATEGORIES (
    CATEGORYID INT PRIMARY KEY AUTO_INCREMENT,
    CATEGORYNAME VARCHAR(100),
    DESCRIPTION TEXT
);

-- PRODUCTS TABLE
CREATE TABLE PRODUCTS (
    PRODUCTID INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCTNAME VARCHAR(200),
    DESCRIPTION TEXT,
    PRICE DECIMAL(10, 2),
    STOCKQUANTITY INT,
    CATEGORYID INT,
    FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES(CATEGORYID)
);

-- ORDERS TABLE
CREATE TABLE ORDERS (
    ORDERID INT PRIMARY KEY AUTO_INCREMENT,
    USERID INT,
    ORDERDATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    TOTALAMOUNT DECIMAL(10, 2),
    STATUS VARCHAR(50),
    FOREIGN KEY (USERID) REFERENCES USERS(USERID)
);

-- ORDERDETAILS TABLE
CREATE TABLE ORDERDETAILS (
    ORDERDETAILID INT PRIMARY KEY AUTO_INCREMENT,
    ORDERID INT,
    PRODUCTID INT,
    QUANTITY INT,
    UNITPRICE DECIMAL(10, 2),
    FOREIGN KEY (ORDERID) REFERENCES ORDERS(ORDERID),
    FOREIGN KEY (PRODUCTID) REFERENCES PRODUCTS(PRODUCTID)
);

-- PAYMENTS TABLE
CREATE TABLE PAYMENTS (
    PAYMENTID INT PRIMARY KEY AUTO_INCREMENT,
    ORDERID INT,
    PAYMENTMETHOD VARCHAR(50),
    PAYMENTDATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    AMOUNTPAID DECIMAL(10, 2),
    FOREIGN KEY (ORDERID) REFERENCES ORDERS(ORDERID)
);


-- 2. Data Insertion & Manipulation (DML)
-- 6) Insert at least 20–30 rows of sample data into each table.

INSERT INTO USERS (USERID, NAME, EMAIL, PASSWORDHASH, PHONENUMBER, CREATEDAT) VALUES 
(1, 'MEERA VIVAAN', 'user1@example.com', 'HASHED_PASSWORD', '9479297804', '2024-05-16 12:20:28'),
(2, 'ANANYA MEERA', 'user2@example.com', 'HASHED_PASSWORD', '9893731906', '2024-10-04 12:20:28'),
(3, 'ANANYA DIYA', 'user3@example.com', 'HASHED_PASSWORD', '9938951272', '2024-09-19 12:20:28'),
(4, 'ARJUN SAI', 'user4@example.com', 'HASHED_PASSWORD', '9961713975', '2024-10-30 12:20:28'),
(5, 'SAANVI ANIKA', 'user5@example.com', 'HASHED_PASSWORD', '9699893344', '2025-04-12 12:20:28'),
(6, 'SAANVI AYAAN', 'user6@example.com', 'HASHED_PASSWORD', '9801562755', '2025-03-13 12:20:28'),
(7, 'ISHA AADHYA', 'user7@example.com', 'HASHED_PASSWORD', '9251575052', '2024-09-21 12:20:28'),
(8, 'SAI VIHAAN', 'user8@example.com', 'HASHED_PASSWORD', '9434111210', '2025-01-08 12:20:28'),
(9, 'REYANSH ISHA', 'user9@example.com', 'HASHED_PASSWORD', '9189154187', '2024-10-15 12:20:28'),
(10, 'VIVAAN KRISHNA', 'user10@example.com', 'HASHED_PASSWORD', '9583084820', '2024-05-11 12:20:28'),
(11, 'DIYA VIHAAN', 'user11@example.com', 'HASHED_PASSWORD', '9280517518', '2024-05-11 12:20:28'),
(12, 'AARAV ISHAAN', 'user12@example.com', 'HASHED_PASSWORD', '9869856007', '2025-03-11 12:20:28'),
(13, 'ANIKA ADITYA', 'user13@example.com', 'HASHED_PASSWORD', '9410134683', '2025-01-07 12:20:28'),
(14, 'ANANYA SAANVI', 'user14@example.com', 'HASHED_PASSWORD', '9742725424', '2024-06-23 12:20:28'),
(15, 'KIARA AYAAN', 'user15@example.com', 'HASHED_PASSWORD', '9250725958', '2024-11-13 12:20:28'),
(16, 'KIARA AARAV', 'user16@example.com', 'HASHED_PASSWORD', '9123099858', '2024-12-10 12:20:28'),
(17, 'ISHA ISHAAN', 'user17@example.com', 'HASHED_PASSWORD', '9770870927', '2024-11-06 12:20:28'),
(18, 'ARJUN AADHYA', 'user18@example.com', 'HASHED_PASSWORD', '9865514782', '2024-11-18 12:20:28'),
(19, 'SAANVI AADHYA', 'user19@example.com', 'HASHED_PASSWORD', '9606284701', '2025-03-13 12:20:28'),
(20, 'MYRA MYRA', 'user20@example.com', 'HASHED_PASSWORD', '9964065208', '2024-10-11 12:20:28'),
(21, 'AYAAN ANANYA', 'user21@example.com', 'HASHED_PASSWORD', '9372696275', '2024-05-28 12:20:28'),
(22, 'KRISHNA ISHA', 'user22@example.com', 'HASHED_PASSWORD', '9399662016', '2024-08-18 12:20:28'),
(23, 'DIYA KRISHNA', 'user23@example.com', 'HASHED_PASSWORD', '9809122158', '2025-01-19 12:20:28'),
(24, 'MYRA KIARA', 'user24@example.com', 'HASHED_PASSWORD', '9980588423', '2025-02-23 12:20:28'),
(25, 'ANANYA KIARA', 'user25@example.com', 'HASHED_PASSWORD', '9147963627', '2024-05-18 12:20:28'),
(26, 'MEERA KRISHNA', 'user26@example.com', 'HASHED_PASSWORD', '9670035150', '2024-06-10 12:20:28'),
(27, 'SAI KRISHNA', 'user27@example.com', 'HASHED_PASSWORD', '9169204610', '2024-06-07 12:20:28'),
(28, 'KRISHNA REYANSH', 'user28@example.com', 'HASHED_PASSWORD', '9932027480', '2025-04-12 12:20:28'),
(29, 'REYANSH MEERA', 'user29@example.com', 'HASHED_PASSWORD', '9858182003', '2025-02-20 12:20:28'),
(30, 'MYRA AADHYA', 'user30@example.com', 'HASHED_PASSWORD', '9649441361', '2024-09-14 12:20:28');

SELECT * FROM USERS;

INSERT INTO CATEGORIES (CATEGORYID, CATEGORYNAME, DESCRIPTION) VALUES 
(1, 'ELECTRONICS', 'DEVICES AND GADGETS'),
(2, 'CLOTHING', 'MEN AND WOMEN APPAREL'),
(3, 'BOOKS', 'FICTION, NON-FICTION, ACADEMIC'),
(4, 'HOME DECOR', 'DECORATIVE ITEMS FOR HOME'),
(5, 'GROCERIES', 'DAILY GROCERY ESSENTIALS'),
(6, 'FITNESS', 'FITNESS AND WELLNESS PRODUCTS');

SELECT * FROM CATEGORIES;

INSERT INTO PRODUCTS (PRODUCTID, PRODUCTNAME, DESCRIPTION, PRICE, STOCKQUANTITY, CATEGORYID) VALUES 
(1, 'LAPTOP PRO', 'HIGH PERFORMANCE LAPTOP FOR WORK AND GAMING', 74999.99, 25, 1),
(2, 'SMARTPHONE MAX', 'DUAL SIM 5G SMARTPHONE WITH AMOLED DISPLAY', 35999.00, 40, 1),
(3, 'WIRELESS EARBUDS', 'NOISE CANCELLATION BLUETOOTH EARBUDS', 2999.99, 60, 1),
(4, 'KURTA SET', 'COTTON PRINTED KURTA SET FOR WOMEN', 1599.50, 50, 2),
(5, 'JEANS', 'SLIM FIT DENIM JEANS FOR MEN', 1299.00, 70, 2),
(6, 'SAREE', 'TRADITIONAL INDIAN DESIGNER SAREE', 2499.00, 30, 2),
(7, 'NOVEL - THE SHADOW', 'MYSTERY THRILLER BOOK BESTSELLER', 499.00, 80, 3),
(8, 'TEXTBOOK - MATHS XII', 'CBSE BOARD MATHS TEXTBOOK FOR CLASS XII', 699.00, 55, 3),
(9, 'COMIC BOOK', 'INDIAN SUPERHERO COMIC EDITION 3', 299.00, 100, 3),
(10, 'WALL CLOCK', 'WOODEN DECORATIVE WALL CLOCK', 899.99, 20, 4),
(11, 'LAMPSHADE', 'DECORATIVE TABLE LAMP WITH SHADE', 1499.00, 15, 4),
(12, 'PHOTO FRAME SET', 'WALL HANGING PHOTO FRAMES COMBO PACK', 999.00, 45, 4),
(13, 'BASMATI RICE 5KG', 'PREMIUM QUALITY BASMATI RICE PACK', 549.00, 60, 5),
(14, 'ATTA 10KG', 'WHOLE WHEAT FLOUR PACK FOR DAILY USE', 410.00, 50, 5),
(15, 'COOKING OIL 1L', 'REFINED SUNFLOWER OIL FOR COOKING', 180.00, 100, 5),
(16, 'YOGA MAT', 'NON-SLIP YOGA MAT WITH CARRY STRAP', 1299.00, 40, 6),
(17, 'DUMBBELL SET 10KG', 'RUBBER COATED DUMBBELL PAIR', 2199.00, 30, 6),
(18, 'TREADMILL', 'MOTORISED TREADMILL FOR HOME GYM', 42999.00, 10, 6),
(19, 'SMARTWATCH', 'FITNESS TRACKING SMARTWATCH WITH GPS', 4999.00, 35, 1),
(20, 'SHIRT FORMAL', 'MEN''S REGULAR FIT COTTON SHIRT', 999.00, 50, 2),
(21, 'SALWAR SUIT', 'WOMEN''S ETHNIC SALWAR SUIT SET', 1999.00, 25, 2),
(22, 'STUDY LAMP', 'ADJUSTABLE LED STUDY TABLE LAMP', 899.00, 40, 4),
(23, 'WHEAT FLAKES', 'BREAKFAST CEREAL - HIGH FIBER', 249.00, 65, 5),
(24, 'JUMP ROPE', 'SKIPPING ROPE FOR CARDIO FITNESS', 399.00, 90, 6),
(25, 'HEADPHONES', 'WIRED HEADPHONES WITH MIC', 799.00, 75, 1),
(26, 'NOTEBOOK SET', 'RULED NOTEBOOKS FOR STUDENTS', 299.00, 120, 3),
(27, 'DECOR LIGHTS', 'LED FAIRY LIGHTS FOR ROOM DECORATION', 499.00, 70, 4),
(28, 'GREEN TEA', 'HERBAL GREEN TEA BAGS PACK', 320.00, 85, 5),
(29, 'PROTEIN POWDER', 'WHEY PROTEIN FOR MUSCLE GAIN', 2999.00, 30, 6),
(30, 'BOOKSHELF', 'WOODEN BOOKSHELF FOR HOME OFFICE', 2999.00, 12, 4);

SELECT * FROM PRODUCTS;

INSERT INTO ORDERS (ORDERID, USERID, ORDERDATE, TOTALAMOUNT, STATUS) VALUES 
(1, 1, '2025-04-12 10:30:00', 22999.99, 'SHIPPED'),
(2, 2, '2025-04-12 11:00:00', 4999.99, 'PENDING'),
(3, 3, '2025-04-12 12:15:00', 1999.00, 'DELIVERED'),
(4, 4, '2025-04-12 13:45:00', 4999.00, 'PENDING'),
(5, 5, '2025-04-12 14:30:00', 7999.00, 'SHIPPED'),
(6, 6, '2025-04-13 09:15:00', 10999.00, 'DELIVERED'),
(7, 7, '2025-04-13 10:30:00', 3599.00, 'PENDING'),
(8, 8, '2025-04-13 11:50:00', 1499.50, 'SHIPPED'),
(9, 9, '2025-04-13 12:25:00', 1699.00, 'PENDING'),
(10, 10, '2025-04-13 13:15:00', 4999.00, 'DELIVERED'),
(11, 11, '2025-04-14 08:30:00', 2499.00, 'PENDING'),
(12, 12, '2025-04-14 09:10:00', 4999.99, 'SHIPPED'),
(13, 13, '2025-04-14 10:25:00', 4599.50, 'DELIVERED'),
(14, 14, '2025-04-14 11:50:00', 2999.00, 'PENDING'),
(15, 15, '2025-04-14 12:30:00', 2999.00, 'SHIPPED'),
(16, 16, '2025-04-14 13:10:00', 7999.00, 'DELIVERED'),
(17, 17, '2025-04-15 10:00:00', 3499.99, 'PENDING'),
(18, 18, '2025-04-15 10:45:00', 9999.99, 'SHIPPED'),
(19, 19, '2025-04-15 11:20:00', 1999.00, 'DELIVERED'),
(20, 20, '2025-04-15 12:05:00', 7999.00, 'PENDING'),
(21, 21, '2025-04-15 12:50:00', 5499.00, 'SHIPPED'),
(22, 22, '2025-04-16 09:40:00', 999.99, 'DELIVERED'),
(23, 23, '2025-04-16 10:30:00', 1999.50, 'PENDING'),
(24, 24, '2025-04-16 11:10:00', 7999.00, 'SHIPPED'),
(25, 25, '2025-04-16 11:45:00', 2499.00, 'DELIVERED'),
(26, 26, '2025-04-16 12:30:00', 2499.00, 'PENDING'),
(27, 27, '2025-04-16 13:00:00', 3599.00, 'SHIPPED'),
(28, 28, '2025-04-16 14:10:00', 9999.00, 'DELIVERED'),
(29, 29, '2025-04-17 10:50:00', 2499.00, 'PENDING'),
(30, 30, '2025-04-17 11:35:00', 9999.99, 'SHIPPED');

SELECT * FROM ORDERS;

INSERT INTO ORDERDETAILS (ORDERDETAILID, ORDERID, PRODUCTID, QUANTITY, UNITPRICE) VALUES 
(1, 1, 1, 1, 74999.99),
(2, 1, 2, 1, 35999.00),
(3, 2, 3, 2, 2999.99),
(4, 3, 4, 1, 1599.50),
(5, 3, 5, 1, 1299.00),
(6, 4, 6, 1, 2499.00),
(7, 5, 7, 2, 2999.00),
(8, 6, 8, 1, 4999.00),
(9, 7, 9, 3, 299.00),
(10, 8, 10, 2, 899.99),
(11, 9, 11, 1, 1499.00),
(12, 10, 12, 2, 999.00),
(13, 11, 13, 3, 549.00),
(14, 12, 14, 1, 410.00),
(15, 13, 15, 1, 180.00),
(16, 14, 16, 2, 1299.00),
(17, 15, 17, 1, 2199.00),
(18, 16, 18, 1, 42999.00),
(19, 17, 19, 1, 4999.00),
(20, 18, 20, 1, 999.00),
(21, 19, 21, 2, 1999.00),
(22, 20, 22, 1, 899.00),
(23, 21, 23, 3, 249.00),
(24, 22, 24, 2, 399.00),
(25, 23, 25, 1, 799.00),
(26, 24, 26, 4, 299.00),
(27, 25, 27, 2, 499.00),
(28, 26, 28, 2, 320.00),
(29, 27, 29, 1, 2999.00),
(30, 28, 30, 1, 2999.00);

SELECT * FROM ORDERDETAILS;

INSERT INTO PAYMENTS (PAYMENTID, ORDERID, PAYMENTMETHOD, PAYMENTDATE, AMOUNTPAID) VALUES 
(1, 1, 'CREDIT CARD', '2025-04-12 10:40:00', 22999.99),
(2, 2, 'DEBIT CARD', '2025-04-12 11:05:00', 4999.99),
(3, 3, 'UPI', '2025-04-12 12:20:00', 1999.00),
(4, 4, 'NET BANKING', '2025-04-12 13:50:00', 4999.00),
(5, 5, 'CASH ON DELIVERY', '2025-04-12 14:35:00', 7999.00),
(6, 6, 'UPI', '2025-04-13 09:20:00', 10999.00),
(7, 7, 'CREDIT CARD', '2025-04-13 10:40:00', 3599.00),
(8, 8, 'DEBIT CARD', '2025-04-13 11:55:00', 1499.50),
(9, 9, 'CASH ON DELIVERY', '2025-04-13 12:30:00', 1699.00),
(10, 10, 'NET BANKING', '2025-04-13 13:20:00', 4999.00),
(11, 11, 'UPI', '2025-04-14 08:40:00', 2499.00),
(12, 12, 'CREDIT CARD', '2025-04-14 09:15:00', 4999.99),
(13, 13, 'DEBIT CARD', '2025-04-14 10:30:00', 4599.50),
(14, 14, 'NET BANKING', '2025-04-14 11:55:00', 2999.00),
(15, 15, 'CASH ON DELIVERY', '2025-04-14 12:40:00', 2999.00),
(16, 16, 'UPI', '2025-04-14 13:10:00', 7999.00),
(17, 17, 'DEBIT CARD', '2025-04-15 10:10:00', 3499.99),
(18, 18, 'CREDIT CARD', '2025-04-15 10:50:00', 9999.99),
(19, 19, 'CASH ON DELIVERY', '2025-04-15 11:25:00', 1999.00),
(20, 20, 'NET BANKING', '2025-04-15 12:10:00', 7999.00),
(21, 21, 'UPI', '2025-04-15 12:55:00', 5499.00),
(22, 22, 'DEBIT CARD', '2025-04-16 09:50:00', 999.99),
(23, 23, 'CREDIT CARD', '2025-04-16 10:35:00', 1999.50),
(24, 24, 'CASH ON DELIVERY', '2025-04-16 11:15:00', 7999.00),
(25, 25, 'NET BANKING', '2025-04-16 11:50:00', 2499.00),
(26, 26, 'UPI', '2025-04-16 12:40:00', 2499.00),
(27, 27, 'CREDIT CARD', '2025-04-16 13:00:00', 3599.00),
(28, 28, 'DEBIT CARD', '2025-04-16 14:15:00', 9999.00),
(29, 29, 'CASH ON DELIVERY', '2025-04-17 10:55:00', 2499.00),
(30, 30, 'NET BANKING', '2025-04-17 11:40:00', 9999.99);


SELECT * FROM PAYMENTS;

-- 4) Modify a column (e.g., increase size or change type).
ALTER TABLE USERS 
MODIFY NAME VARCHAR(100);
ALTER TABLE USERS 
CHANGE COLUMN PHONENUMBER PHONE_NO INT8;

-- 5) Drop a column or rename a table.
ALTER TABLE USERS
RENAME COLUMN NAME TO USER_NAME;

-- 7) Update specific rows based on conditions.
UPDATE PAYMENTS 
SET PAYMENTMETHOD = "NET BANKING"
WHERE PAYMENTID=29;
SELECT * FROM PAYMENTS;

-- 8) Delete one or more records using conditions.
 DELETE FROM PAYMENTS 
 WHERE PAYMENTID=29;
DELETE FROM PAYMENTS 
 WHERE PAYMENTID=28;
 SELECT * FROM PAYMENTS;

 
 -- 9) Insert multiple rows using a single statement.
INSERT INTO PAYMENTS(PAYMENTID, ORDERID, PAYMENTMETHOD, PAYMENTDATE, AMOUNTPAID) VALUES 
(29,29,"NET BANKING","2025-03-10 12:11:13", 4999.00),
(28,28,"CASH ON DELIVERY","2025-04-05 02:11:13", 2999.00);

-- 10) Use LOCK to control concurrent updates (optional for advanced users).
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 3. SELECT Queries & Filtering
-- 11) Retrieve all data from a table.
SELECT * FROM USERS;

-- 12) Select specific columns with WHERE conditions.
SELECT USER_NAME,PHONE_NO FROM USERS
WHERE USERID=18;

-- 12) Select specific columns with WHERE conditions.
-- 13) Use BETWEEN, IN, IS NULL, LIKE for filtering.
-- BETWEEN
SELECT USER_NAME FROM USERS 
WHERE USERID BETWEEN 5 AND 10;
-- IN 
SELECT USER_NAME,USERID,PHONE_NO FROM USERS
WHERE USERID IN (14,15,6,8);
-- IS NULL 
SELECT USER_NAME,PHONE_NO FROM USERS
WHERE PHONE_NO IS NULL;
-- LIKE
SELECT * FROM USERS
WHERE PHONE_NO LIKE "%93%" ;


-- 14) Show top 5 records using LIMIT or sorted by a column.
SELECT * FROM PAYMENTS
ORDER BY AMOUNTPAID DESC
LIMIT 5; 


-- 15) Combine filters using AND, OR, and NOT.
SELECT * FROM ORDERS
WHERE TOTALAMOUNT > 8000 AND STATUS ="PRIORITY";
SELECT * FROM ORDERS
WHERE TOTALAMOUNT > 8000 OR STATUS ="PRIORITY";
SELECT * FROM ORDERS
WHERE NOT STATUS= "PRIORITY";

-- 🔹 4. Sorting, Distinct, and Pagination
-- 16) Display unique values from a column using DISTINCT.
SELECT DISTINCT STATUS FROM ORDERS;

-- 17) Sort records in ascending/descending order using ORDER BY.
SELECT TOTALAMOUNT FROM ORDERS
ORDER BY TOTALAMOUNT DESC;

SELECT TOTALAMOUNT FROM ORDERS
ORDER BY TOTALAMOUNT ASC;

-- 18) Implement pagination using LIMIT and OFFSET.
SELECT * FROM PRODUCTS
ORDER BY STOCKQUANTITY DESC 
LIMIT 10 OFFSET 15;

-- 🔹 5. Aggregate Functions & Grouping
-- 19) Use COUNT, SUM, AVG, MIN, MAX on relevant numeric columns.
SELECT COUNT(*) FROM PAYMENTS;
SELECT SUM(AMOUNTPAID) FROM PAYMENTS;
SELECT AVG(AMOUNTPAID) FROM PAYMENTS;
SELECT MAX(AMOUNTPAID) FROM PAYMENTS;
SELECT MIN(AMOUNTPAID) FROM PAYMENTS;

-- 20) Group records by a specific column and apply aggregation.
SELECT CATEGORYID,SUM(PRICE) AS CAT_TOTAL,MIN(PRICE) AS CAT_MIN,MAX(PRICE) AS CAT_MAX,AVG(PRICE) AS AVG_CAT  FROM PRODUCTS
GROUP BY CATEGORYID;

-- 21) Filter groups using HAVING (e.g., show groups with more than 3 items).
SELECT CATEGORYID FROM PRODUCTS
GROUP BY CATEGORYID
HAVING COUNT(*)> 5;

SELECT PRODUCTNAME FROM PRODUCTS
GROUP BY PRODUCTNAME
HAVING PRODUCTNAME LIKE "%SMART%";


-- 6. JOINS
-- 22) Use INNER JOIN to combine data from at least two related tables.
SELECT * FROM USERS
INNER JOIN ORDERS
ON USERS.USERID=ORDERS.USERID ;

-- 23) Use LEFT JOIN or RIGHT JOIN to display unmatched data as well.
SELECT * FROM CATEGORIES
LEFT JOIN PRODUCTS
ON CATEGORIES.CATEGORYID=PRODUCTS.CATEGORYID;

SELECT * FROM CATEGORIES
RIGHT JOIN PRODUCTS
ON CATEGORIES.CATEGORYID=PRODUCTS.CATEGORYID;

-- 24) Join three or more tables to produce a meaningful report.
SELECT USERS.USER_NAME,USERS.USERID,ORDERDETAILS.ORDERID,PAYMENTS.AMOUNTPAID FROM USERS 
INNER JOIN ORDERS
ON ORDERS.USERID=USERS.USERID
INNER JOIN ORDERDETAILS
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
INNER JOIN PAYMENTS
ON ORDERDETAILS.ORDERID=PAYMENTS.ORDERID;

-- 25) Write a subquery in WHERE to compare against aggregated data.
SELECT * FROM PAYMENTS
WHERE AMOUNTPAID >
( SELECT AVG(AMOUNTPAID) FROM PAYMENTS )
;

-- 26) Use a subquery in FROM as a derived table.
 SELECT U.USERID, SPENT.TOTAL_SPENT
FROM USERS U
JOIN (
    SELECT USERID, SUM(TOTALAMOUNT) AS TOTAL_SPENT
    FROM ORDERS
    GROUP BY USERID
) AS SPENT ON U.USERID = SPENT.USERID
WHERE SPENT.TOTAL_SPENT > 10000;


-- 27) Implement a correlated subquery for row-wise comparison.
SELECT O1.ORDERID, O1.USERID, O1.TOTALAMOUNT
FROM ORDERS O1
WHERE O1.TOTALAMOUNT > (
    SELECT AVG(O2.TOTALAMOUNT)
    FROM ORDERS O2
    WHERE O2.USERID = O1.USERID AND O2.ORDERID != O1.ORDERID
);

-- 28) Concatenate two or more columns into one.
SELECT CONCAT(USERS.USERID,"  ",USERS.USER_NAME,"  ",USERS.EMAIL) 
AS CONCATENATED FROM USERS;

-- 29) Change the case of text using UPPER or LOWER.
SELECT LOWER(USER_NAME) AS LOWER_CASE FROM USERS;
SELECT UPPER(CATEGORYNAME) AS UPPER_CASE FROM CATEGORIES;

-- 30) Use SUBSTRING, REPLACE, or REVERSE on text fields.
SELECT SUBSTRING(DESCRIPTION,10) AS SUB_STR FROM PRODUCTS;
SELECT REPLACE(EMAIL,"@example.com","@gmail.com") FROM USERS;
SELECT REVERSE(PHONE_NO) AS REVERSED FROM USERS;

-- 31) Extract left/right parts of a string, Use Other Strings.
SELECT LEFT(EMAIL,6) AS LEFT_EXTRACT FROM USERS;
SELECT RIGHT(EMAIL,12) AS RIGHT_EXTRACT FROM USERS;
SELECT TRIM(EMAIL) AS TRIMMED FROM USERS;
SELECT LTRIM(EMAIL) AS TRIMMED FROM USERS;
SELECT RTRIM(EMAIL) AS TRIMMED FROM USERS;

-- 🔹 9. Date & Time Functions

-- 32) Extract parts of a date (year, month, day) using YEAR(), MONTH(), etc.
SELECT YEAR(CREATEDAT) AS YEAR_CREATED FROM USERS;
SELECT MONTH(CREATEDAT) AS MONTH_CREATED FROM USERS;
SELECT DAY(CREATEDAT) AS DAY_CREATED FROM USERS;
SELECT HOUR(CREATEDAT) AS HOUR_CREATED FROM USERS;
SELECT MINUTE(CREATEDAT) AS MINUTES_CREATED FROM USERS;
SELECT SECOND(CREATEDAT) AS SECONDS_CREATED FROM USERS;
SELECT YEAR(CREATEDAT) AS YEAR_CREATED,MONTH(CREATEDAT) AS MONTH_CREATED,DAY(CREATEDAT) AS DAY_CREATED,HOUR(CREATEDAT) AS HOUR_CREATED,MINUTE(CREATEDAT) AS MINUTES_CREATED,SECOND(CREATEDAT) AS SECONDS_CREATED FROM USERS;


-- 33) Get current date/time using NOW(), CURDATE(), CURTIME().
-- 34) Find the difference between two dates using DATEDIFF() or TIMESTAMPDIFF().
-- 35) Add or subtract time from a date using DATE_ADD() or DATE_SUB().

SELECT NOW() AS NOW,
      CURDATE() AS CURDATE,
      CURTIME() AS CURTIME,
	  DATEDIFF("2025-03-12 11:05:23",NOW()) AS DIFF,
	  TIMESTAMPDIFF(MINUTE,"11:05:23",CURTIME()) AS MINUTE_DIFF,
	  TIMESTAMPDIFF(DAY,"2025-04-20 11:05:23",CURDATE()) AS DAY_DIFF,
	  TIMESTAMPDIFF(MONTH,"2025-2-20 11:05:23",CURDATE()) AS MONTH_DIFF,
	  TIMESTAMPDIFF(YEAR,"1985-04-20 11:05:23",CURDATE()) AS YEAR_DIFF,
      DATE_ADD(CURDATE(),INTERVAL 10 DAY) AS ADDED_DATE,
	  DATE_SUB(CURDATE(),INTERVAL 10 DAY)AS SUBTRACTED_DATE;


-- 🔹 10. Conditional Logic & CASE
-- 36) Use CASE to assign labels (e.g., rating, status, grade) based on column values.
SELECT ORDERID, STATUS,
  CASE 
    WHEN STATUS = 'PRIORITY' THEN 'COMPLETED'
    WHEN STATUS = 'REGULAR' THEN 'On the Way'
    WHEN STATUS = 'STANDARD' THEN 'WAITING'
    ELSE 'Unknown'
  END AS STATUS_LABEL
FROM ORDERS;

-- 37) Use CASE in ORDER BY or UPDATE to apply dynamic logic
SELECT ORDERID, STATUS
FROM ORDERS
ORDER BY 
  CASE 
    WHEN STATUS = 'PRIORITY' THEN 1
    WHEN STATUS = 'REGULAR' THEN 2
    WHEN STATUS = 'STANDARD' THEN 3
    ELSE 4
  END;
UPDATE ORDERS
SET STATUS = 
  CASE 
    WHEN TOTALAMOUNT > 10000 THEN 'PRIORITY'
    WHEN TOTALAMOUNT > 5000 THEN 'STANDARD'
    ELSE 'REGULAR'
  END;
SELECT * FROM ORDERS;

-- 11.VIEWS
-- 38) Create a view that summarizes key data (e.g., top customers, popular products).

CREATE VIEW CUSTOMER_ORDER_SUMMARY AS
SELECT USERS.USERID, USERS.USER_NAME, COUNT(ORDERS.ORDERID) AS TOTAL_ORDERS, SUM(ORDERS.TOTALAMOUNT) AS TOTAL_SPENT
FROM USERS 
JOIN ORDERS  ON USERS.USERID = ORDERS.USERID
GROUP BY USERS.USERID, USERS.USER_NAME;
SELECT * FROM CUSTOMER_ORDER_SUMMARY;

-- 39) Create a view for public reporting (e.g., showing only non-sensitive data).
CREATE VIEW PUBLIC_PRODUCT_REPORT AS
SELECT 
  P.PRODUCTID,
  P.PRODUCTNAME,
  C.CATEGORYNAME,
  P.PRICE,
  SUM(OD.QUANTITY) AS TOTAL_UNITS_SOLD,
  SUM(OD.QUANTITY * OD.UNITPRICE) AS TOTAL_REVENUE
FROM PRODUCTS P
JOIN ORDERDETAILS OD ON P.PRODUCTID = OD.PRODUCTID
JOIN CATEGORIES C ON P.CATEGORYID = C.CATEGORYID
GROUP BY P.PRODUCTID, P.PRODUCTNAME, C.CATEGORYNAME, P.PRICE;
SELECT * FROM PUBLIC_PRODUCT_REPORT;

-- 40) Query the view using filters and joins.
SELECT *
FROM PUBLIC_PRODUCT_REPORT
WHERE TOTAL_REVENUE > 10000;

SELECT PPR.PRODUCTID, PPR.PRODUCTNAME, PPR.TOTAL_UNITS_SOLD, P.STOCKQUANTITY
FROM PUBLIC_PRODUCT_REPORT PPR
JOIN PRODUCTS P ON PPR.PRODUCTID = P.PRODUCTID
WHERE P.STOCKQUANTITY < 20;

-- ER DIAGRAM
-- 41) Draw the ER diagram showing tables, primary keys, and relationships.

-- 42) Indicate relationship types (1:1, 1:N, M:N).
-- Users - Orders (1:N)
-- Orders - Orderdetails (1:N)
-- Products - Orderdetails (1:N)
-- Categories - Products (1:N)
-- Orders - Payments (1:N)


-- 43) Explain the role of each foreign key in maintaining data integrity

-- PRODUCTS.CATEGORYID → CATEGORIES.CATEGORYID ----> Ensures that every product is linked to a valid category, preventing orphan products
-- ORDERS.USERID → USERS.USERID -------> Guarantees that each order is placed by a registered user, avoiding references to non-existent users.
-- ORDERDETAILS.ORDERID → ORDERS.ORDERID ---------> Confirms that all order items belong to a valid order, enforcing consistency in order data.
-- ORDERDETAILS.PRODUCTID → PRODUCTS.PRODUCTID ------> Ensures that each item in an order refers to a valid product, preventing broken product references.
-- PAYMENTS.ORDERID → ORDERS.ORDERID ------> Links payments to actual orders, ensuring payments can't exist without an order.
