-- Write a query to retrieve the customer data for every customer who does not currently subscribe to any services.

SELECT c.* FROM customers c LEFT OUTER JOIN customers_services cs
ON c.id = cs.customer_id
WHERE cs.customer_id IS NULL;

--  id |     name      | payment_token | id |     description     | price
-- ----+---------------+---------------+----+---------------------+--------
--   2 | Nancy Monreal | JKWQPJKL      |    |                     |
--     |               |               |  8 | One-to-one Training | 999.00
-- (2 rows)

SELECT c.*, s.* FROM customers c FULL OUTER JOIN customers_services cs
ON c.id = cs.customer_id
FULL OUTER JOIN services s
ON s.id = cs.service_id
WHERE cs.customer_id IS NULL;