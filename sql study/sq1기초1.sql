SELECT *
FROM customers
WHERE birth_date > '1990-01-01' or points > 1000 AND
state = 'VA'

SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity > 30

SELECT *
FROM customers
WHERE state NOT IN ('VA','FL','GA')

SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72)

SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'

SELECT *
FROM customers
WHERE last_name LIKE 'brush%'
-- % any number of characters
-- _single character

SELECT *
FROM customers
WHERE address LIKE '%trail%'
or	address LIKE '%avenue%'




