-- We've realized that the last two parts we're using for device number 2, "Gyroscope", 
-- actually belong to an "Accelerometer". Write an SQL statement that will associate the 
-- last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".

UPDATE parts
SET device_id = 1
WHERE part_number = 200 OR part_number = 150;