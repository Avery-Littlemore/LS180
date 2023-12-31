-- Write an SQL query to display all devices along with all the parts that make them up. 
-- We only want to display the name of the devices. Its parts should only display the part_number.
-- 
-- Expected output:
-- 
--      name      | part_number
-- ---------------+-------------
--  Accelerometer |          12
--  Accelerometer |          14
--  Accelerometer |          16
--  Gyroscope     |          31
--  Gyroscope     |          33
--  Gyroscope     |          35
--  Gyroscope     |          37
--  Gyroscope     |          39
-- (8 rows)
-- 
-- NOTE: The part numbers and sequence may vary from those shown above.

SELECT d.name, p.part_number FROM devices d JOIN parts p ON d.id = p.device_id;