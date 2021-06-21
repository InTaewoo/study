show tables;
SELECT * FROM employees;
SELECT firstname FROM employees;
SELECT employeenumber,firstName, lastName FROM employees
WHERE employeeNumber >= 1300;

SELECT * FROM offices;
SELECT city FROM offices
WHERE officeCode = 1;

SELECT city, phone FROM offices
WHERE officeCode = 1;

SELECT * FROM classicmodels.orders;

SELECT O.customerNumber, C.country
FROM orders O LEFT JOIN customers C ON
O.customerNumber = C.customerNumber;

SELECT O.orderNumber, C.country
FROM orders O INNER JOIN customers C ON
O.customerNumber = C.customerNumber
WHERE C.country = 'usa' LIMIT 10




