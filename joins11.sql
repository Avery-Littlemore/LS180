-- Write a query to return the name of every product included in an order 
-- alongside the number of times it has been ordered. Sort the results by
-- product name, ascending.

SELECT p.product_name, count(oi.product_id) AS "# of times it has been ordered"
FROM order_items oi JOIN products p
ON p.id = oi.product_id
GROUP BY p.product_name ORDER BY p.product_name;
