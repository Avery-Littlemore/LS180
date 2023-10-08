-- Write an SQL query that returns a result table with the name
-- of each device in our database together with the number of parts for that device.

SELECT devices.name, count(parts.device_id) FROM devices JOIN parts ON devices.id = parts.device_id GROUP BY devices.name;

-- Better to use LEFT OUTER JOIN for ALL of the devices even if no parts are assigned.

SELECT devices.name, COUNT(parts.device_id) FROM devices
LEFT OUTER JOIN parts ON devices.id = parts.device_id GROUP BY devices.name;