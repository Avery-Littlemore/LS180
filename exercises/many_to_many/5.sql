-- Write a query to display a list of all customer names together with a comma-separated list of the services they use. 
-- Your output should look like this:

--      name      |                                services
-- ---------------+-------------------------------------------------------------------------
--  Pat Johnson   | Unix Hosting, DNS, Whois Registration
--  Nancy Monreal |
--  Lynn Blake    | DNS, Whois Registration, High Bandwidth, Business Support, Unix Hosting
--  Chen Ke-Hua   | High Bandwidth, Unix Hosting
--  Scott Lakso   | DNS, Dedicated Hosting, Unix Hosting
--  Jim Pornot    | Unix Hosting, Dedicated Hosting, Bulk Email
-- (6 rows)

SELECT c.name, string_agg(s.description, ', ') AS "services" FROM customers c LEFT OUTER JOIN customers_services cs
ON c.id = cs.customer_id
LEFT OUTER JOIN services s
ON s.id = cs.service_id
GROUP BY c.name, c.id ORDER BY c.id;