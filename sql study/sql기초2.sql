SELECT * FROM customers
WHERE first_name REGEXP 'elka|ambur'

SELECT * FROM customers
WHERE last_name REGEXP 'EY$|ON$'

SELECT * FROM customers
WHERE last_name REGEXP 'MY$|SE'

SELECT * FROM customers
WHERE last_name REGEXP '[B]RU'

SELECT * FROM customers
WHERE last_name REGEXP 'MY$|SE'

SELECT *
FROM customers
WHERE phone IS NOT NULL

SELECT * FROM orders
WHERE shipped_date IS NULL

SELECT *
FROM customers
LIMIT 6,3 -- 6부터 3개

-- -- page 1: 1-3

SELECT * FROM customers
ORDER BY points desc
LIMIT 3

SELECT order_id, orders.customer_id,first_name, last_name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id

SELECT order_id, o.product_id, quantity, o.unit_price
FROM order_items o
JOIN products p
ON (p.product_id = o.product_id)

use sql_hr;

SELECT *
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id