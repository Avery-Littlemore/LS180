-- For this exercise, use a scalar subquery to determine the number of bids on each item. 
-- The entire query should return a table that has the name of each item along with the number of bids on an item.

-- Here is the expected output:

--     name      | count
-- --------------+-------
-- Video Game    |     4
-- Outdoor Grill |     1
-- Painting      |     8
-- Tent          |     4
-- Vase          |     9
-- Television    |     0
-- (6 rows)

SELECT name, 
  (SELECT count(item_id) FROM bids where items.id = bids.item_id)
FROM items;