USE sql_store;

SELECT *
FROM customers;

SELECT DISTINCT state
FROM customers;

SELECT name, unit_price, unit_price*1.1 AS new_price
FROM products;

SELECT *
FROM customers
WHERE birth_date > '1990-01-01';

SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price*quantity > 30;

SELECT *
FROM customers
WHERE state in('VA','FL','GA');

SELECT *
FROM products
WHERE quantity_in_stock in ('49','38','72');

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

SELECT *
FROM customers
WHERE last_name LIKE 'b____y'
-- %any number of charcters;

SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR 
	  address LIKE '%AVENUE%';
      
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

SELECT * 
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';

