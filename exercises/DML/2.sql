-- Now that we have the infrastructure for our workshop set up, let's start adding in some data. 
-- Add in two different devices. One should be named, "Accelerometer". The other should be named, "Gyroscope".

INSERT INTO devices (name)
VALUES ('Accelerometer'), ('Gyroscope');

-- The first device should have 3 parts (this is grossly simplified). The second device should have 5 parts. 
-- The part numbers may be any number between 1 and 10000. There should also be 3 parts that don't belong to any device yet.

INSERT INTO parts (part_number, device_id)
VALUES (8, 1), (11, 1), (18, 1),
(50, 2), (100, 2), (150, 2), (200, 2), (250, 2);

INSERT INTO parts (part_number)
VALUES (500), (600), (700);