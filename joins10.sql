SELECT sum(p.product_cost) AS "Natasha O'Shea's Total"
FROM customers c JOIN orders o
ON c.id = o.customer_id
JOIN order_items oi
ON o.id = oi.order_id
JOIN products p
ON p.id = oi.product_id
WHERE c.customer_name = 'Natasha O''Shea';
