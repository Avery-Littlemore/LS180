-- Write a query to retrieve the customer data for every customer who currently subscribes to at least one service.

SELECT DISTINCT c.* FROM customers c JOIN customers_services cs
ON c.id = cs.customer_id
WHERE cs.customer_id IS NOT NULL;