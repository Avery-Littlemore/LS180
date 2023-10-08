-- Write a query that displays the description for every service that is subscribed to by at least 3 customers. 
-- Include the customer count for each description in the report. The report should look like this:
-- 
--  description  | count
-- --------------+-------
--  DNS          |     3
--  Unix Hosting |     5
-- (2 rows)

SELECT s.description, count(s.id) AS "count" FROM services s JOIN customers_services cs
ON s.id = cs.service_id
GROUP BY s.description
HAVING count(s.id) >= 3;