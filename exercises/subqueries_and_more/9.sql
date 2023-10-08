-- In this exercise, we'll use EXPLAIN ANALYZE to compare the efficiency of two SQL statements. 
-- These two statements are actually from the "Query From a Virtual Table" exercise in this set. 
-- In that exercise, we stated that our subquery-based solution:

SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

                                                    QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.071..0.072 rows=1 loops=1)
   ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.061..0.065 rows=6 loops=1)
         Group Key: bids.bidder_id
         Batches: 1  Memory Usage: 40kB
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.019..0.025 rows=26 loops=1)
 Planning Time: 0.215 ms
 Execution Time: 0.151 ms
(7 rows)


-- was actually faster than the simpler equivalent without subqueries:

SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

                                                       QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 Limit  (cost=35.65..35.65 rows=1 width=12) (actual time=0.232..0.233 rows=1 loops=1)
   ->  Sort  (cost=35.65..36.15 rows=200 width=12) (actual time=0.230..0.230 rows=1 loops=1)
         Sort Key: (count(bidder_id)) DESC
         Sort Method: top-N heapsort  Memory: 25kB
         ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.202..0.205 rows=6 loops=1)
               Group Key: bidder_id
               Batches: 1  Memory Usage: 40kB
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.013..0.018 rows=26 loops=1)
 Planning Time: 0.242 ms
 Execution Time: 0.290 ms
(10 rows)


-- In this exercise, we will demonstrate this fact.
-- Run EXPLAIN ANALYZE on the two statements above. 
-- Compare the planning time, execution time, and the total time required to run these two statements. 
-- Also compare the total "costs". Which statement is more efficient and why?

Subqueries, because planning time + execution time is greater