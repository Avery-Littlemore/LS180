-- Using RIGHT OUTER JOIN, write a query to display a list of all services that are not currently in use.
-- Your output should look like this:

--  description
-- -------------
--  One-to-one Training
-- (1 row)

SELECT s.description FROM customers_services cs RIGHT OUTER JOIN services s
ON cs.service_id = s.id
WHERE cs.service_id IS NULL;