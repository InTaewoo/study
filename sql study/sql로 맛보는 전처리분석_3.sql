use classicmodels;
SELECT * FROM orders O RIGHT JOIN customers C
ON O.customerNumber = C.customerNumber;

SELECT country,
CASE WHEN country IN ('Canada','USA') THEN 'North America' ELSE 'OTHERS' END AS region
FROM customers LIMIT 10;

SELECT CASE WHEN country IN ('Canada','USA') THEN 'NORTH AMERICA'ELSE 'OTHERS' END AS region ,
count(customerNumber) AS N_CUSTOMERS
FROM customers
GROUP BY 1;

SELECT buyprice,
ROW_NUMBER() OVER(ORDER BY buyprice) AS 'ROWNUMBER',
RANK() OVER (ORDER BY buyprice) AS 'RNK',
DENSE_RANK() OVER (ORDER by buyprice) AS 'DENSERANK'
FROM products;

SELECT BUYPRICE,
ROW_NUMBER() OVER(PARTITION By productline ORDER BY buyprice) AS 'ROWNUMBER',
RANK() OVER(PARTITION By productline ORDER BY buyprice) AS 'RNK',
DENSE_RANK() OVER(PARTITION By productline ORDER BY buyprice) AS 'DENSERANK'
FROM products LIMIT 10;

SELECT orderNumber
FROM orders
WHERE customernumber IN (SELECT customerNumber FROM customers WHERE country ='usa')