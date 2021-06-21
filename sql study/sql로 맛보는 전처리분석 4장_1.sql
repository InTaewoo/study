-- 2장 SQL 문법
-- SELECT
SELECT productCode FROM products;

SELECT customernumber FROM customers LIMIT 10;

SELECT SUM(AMOUNT), COUNT(CHECKNUMBER)
FROM payments;

SELECT productname, productline
FROM products LIMIT 5;

SELECT distinct ordernumber
FROM orderdetails;

-- WHERE
SELECT * FROM orderdetails
WHERE priceEach BETWEEN 30 AND 50 ;

SELECT * FROM orderdetails 
WHERE priceEach >= 30 LIMIT 10;

SELECT * FROM customers
WHERE country IN ('USA','Canada') LIMIT 10;

SELECT * FROM customers
WHERE country NOT IN ('USA','Canada') LIMIT 10;

-- SELECT employee_id FROM employees
-- WHERE reports_to IS NULL;

SELECT addressline1 FROM customers
WHERE addressLine1 LIKE ('ST');

-- GROUP BY
SELECT country, city, count(customernumber) AS N_CUSTOMERS
FROM customers
GROUP BY country,city;

-- CASE WHEN
SELECT SUM(CASE WHEN country = 'USA' THEN 1 ELSE 0 END) AS N_USA,
SUM(CASE WHEN country = 'USA' THEN 1 ELSE 0 END ) / COUNT(*) AS USA_PORTION
FROM customers;

-- JOIN
SELECT A.ordernumber, B.country
FROM orders A LEFT JOIN customers B ON 
A.customernumber = B.customernumber LIMIT 10




