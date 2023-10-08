-- For this exercise, let's explore the EXPLAIN PostgreSQL statement. 
-- It's a very useful SQL statement that lets us analyze the efficiency of our SQL statements. 
-- More specifically, use EXPLAIN to check the efficiency of the query statement we used in the exercise on EXISTS:

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

-- First use just EXPLAIN, then include the ANALYZE option as well. 
-- For your answer, list any SQL statements you used, along with the output you get back, 
-- and your thoughts on what is happening in both cases.

