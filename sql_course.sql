-- name	age	occupation
-- Abby	34	biologist
-- Mu'nisah	26	NULL
-- Mirabelle	40	contractor

CREATE TABLE people (
    name varchar(255),
    age integer CHECK (age >= 0),
    occupation varchar(255)
);

INSERT INTO people
VALUES ('Abby', 34, 'biologist'),
('Mu''nisah', 26, NULL),
('Mirabelle', 40, 'contractor');

-- Write 3 SQL queries that can be used to retrieve the second row of the table shown in #1 and #2.

SELECT * FROM people
WHERE name = 'Mu''nisah';

SELECT * FROM people
WHERE age = 26;

SELECT * FROM people
LIMIT 1 OFFSET 1;

-- name	length	wingspan	family	extinct
-- Spotted Towhee	21.6	26.7	Emberizidae	f
-- American Robin	25.5	36.0	Turdidae	f
-- Greater Koa Finch	19.0	24.0	Fringillidae	t
-- Carolina Parakeet	33.0	55.8	Psittacidae	t
-- Common Kestrel	35.5	73.5	Falconidae	f

CREATE TABLE birds (
    name varchar(255),
    length decimal(4,1),
    wingspan decimal(4,1),
    family text,
    extinct boolean
);

INSERT INTO birds
VALUES 
('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
('American Robin', 25.5, 36.0, 'Turdidae', false),
('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

-- Write a SQL statement that finds the names and families for all birds that are not extinct, 
-- in order from longest to shortest (based on the length column's value).

SELECT name, family FROM birds
WHERE extinct = false
ORDER BY length DESC;

-- Use SQL to determine the average, minimum, and maximum wingspan for the birds shown in the table.

SELECT round(avg(wingspan)), min(wingspan), max(wingspan) FROM birds;
SELECT min(wingspan) FROM birds;
SELECT max(wingspan) FROM birds;

-- item	prep_time	ingredient_cost	sales	menu_price
-- omelette	10	1.50	182	7.99
-- tacos	5	2.00	254	8.99
-- oatmeal	1	0.50	79	5.99

CREATE TABLE menu_items (
    item text,
    prep_time integer,
    ingredient_cost decimal(4,2),
    sales integer,
    menu_price decimal(4,2)
);

INSERT INTO menu_items
VALUES
('omelette',	10,	1.50,	182,	7.99),
('tacos',	5,	2.00,	254,	8.99),
('oatmeal',	1,	0.50,	79,	5.99);

-- Using the table and data from #8 and #9, write a SQL query to determine which menu item is the most profitable 
-- based on the cost of its ingredients, returning the name of the item and its profit.

SELECT item, max((menu_price - ingredient_cost)) AS "Profit" FROM menu_items
GROUP BY item LIMIT 1;

-- Write a SQL query to determine how profitable each item on the menu is based on the amount of time it takes to prepare one item. 
-- Assume that whoever is preparing the food is being paid $13 an hour. List the most profitable items first. 
-- Keep in mind that prep_time is represented in minutes and ingredient_cost and menu_price are both in dollars and cents:

SELECT item, menu_price, ingredient_cost, round((13.0/60.0*prep_time), 2) AS "labour", round((menu_price - ingredient_cost - (13.0/60.0*prep_time)), 2) as "profit" FROM menu_items ORDER BY "profit" DESC;

-- Write the SQL statements needed to add two additional columns to the films table: 
-- director, which will hold a director's full name, and duration, which will hold the length of the film in minutes.

ALTER TABLE films
ADD COLUMN director varchar(255);
ALTER TABLE films ADD COLUMN duration integer;

-- title	director	duration
-- Die Hard	John McTiernan	132
-- Casablanca	Michael Curtiz	102
-- The Conversation	Francis Ford Coppola	113

UPDATE films SET director = 'John McTiernan', duration = 132 WHERE title = 'Die Hard';
UPDATE films SET director = 'Michael Curtiz', duration = 102 WHERE title = 'Casablanca';
UPDATE films SET director = 'Francis Ford Coppola', duration = 113 WHERE title = 'The Conversation';

-- title	year	genre	director	duration
-- 1984	1956	scifi	Michael Anderson	90
-- Tinker Tailor Soldier Spy	2011	espionage	Tomas Alfredson	127
-- The Birdcage	1996	comedy	Mike Nichols	118

INSERT INTO films VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90),
('Tinker Tailor Soldier Spy',	2011,	'espionage',	'Tomas Alfredson',	127),
('The Birdcage',	1996,	'comedy',	'Mike Nichols',	118);

-- Write a SQL statement that will return the title and age in years of each movie, with newest movies listed first:

SELECT title, (2017-year) AS "Age" FROM films ORDER BY "Age"

-- Write a SQL statement that will return the title and duration of each movie longer than two hours, with the longest movies first.

SELECT title, duration FROM films WHERE duration > 120 ORDER BY duration DESC;

-- Write a SQL statement that returns the title of the longest film.

SELECT title FROM FILMS ORDER BY duration DESC LIMIT 1;

-- Write a SQL query to list the ten states with the most rows in the people table in descending order.

SELECT state, count(state) AS "count" FROM people GROUP BY state ORDER BY "count" DESC LIMIT 10;

-- Write a SQL query that lists each domain used in an email address in the people table and 
-- how many people in the database have an email address containing that domain. Domains should be listed with the most popular first.

SELECT substr(email, strpos(email, '@') + 1) AS "domain", count(id) AS "count" FROM people GROUP BY "domain" ORDER BY "count" DESC;

-- Write a SQL statement that will delete the person with ID 3399 from the people table.

DELETE FROM people WHERE id = 3399;

-- Write a SQL statement that will delete all users that are located in the state of California (CA).

DELETE FROM people WHERE state = 'CA';

-- Write a SQL statement that will update the given_name values to be all uppercase for all users with an email address that contains teleworm.us.

UPDATE people
SET given_name = upper(given_name) 
WHERE email LIKE '%teleworm.us';

-- Write a SQL statement that will delete all rows from the people table.

DELETE FROM people;

-- Write the SQL statement to create a table called temperatures to hold the following data:

--    date    | low | high
-- -----------+-----+------
-- 2016-03-01 | 34  | 43
-- 2016-03-02 | 32  | 44
-- 2016-03-03 | 31  | 47
-- 2016-03-04 | 33  | 42
-- 2016-03-05 | 39  | 46
-- 2016-03-06 | 32  | 43
-- 2016-03-07 | 29  | 32
-- 2016-03-08 | 23  | 31
-- 2016-03-09 | 17  | 28

CREATE TABLE temperatures (
    date date NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL
);

INSERT INTO temperatures VALUES
('2016-03-01', 34, 43),
('2016-03-02', 32, 44),
('2016-03-03', 31, 47),
('2016-03-04', 33, 42),
('2016-03-05', 39, 46),
('2016-03-06', 32, 43),
('2016-03-07', 29, 32),
('2016-03-08', 23, 31),
('2016-03-09', 17, 28);

-- Write a SQL statement to determine the average (mean) temperature (divide the sum of the high and low temperatures by two) 
-- for each day from March 2, 2016 through March 8, 2016. Make sure to round each average value to one decimal place.

SELECT date, round((high + low)/2.0, 1) AS "average" FROM temperatures WHERE date >= 'March 2, 2016' AND date <= 'March 8, 2016';

-- Write a SQL statement to add a new column, rainfall, to the temperatures table. It should store millimeters of rain as integers and have a default value of 0.

ALTER TABLE temperatures
ADD COLUMN rainfall integer DEFAULT 0;

-- Each day, it rains one millimeter for every degree the average temperature goes above 35.
-- Write a SQL statement to update the data in the table temperatures to reflect this.

UPDATE temperatures 
SET rainfall = ((high + low)/2 - 35)
WHERE ((high + low)/2 - 35) > 0;

-- A decision has been made to store rainfall data in inches.
-- Write the SQL statements required to modify the rainfall column to reflect these new requirements.

0.0393701

UPDATE temperatures
SET rainfall = round(rainfall * 0.0393701, 3);

ALTER TABLE temperatures
ALTER COLUMN rainfall
TYPE decimal(4,3);

-- Write a SQL statement that renames the temperatures table to weather.

ALTER TABLE temperatures
RENAME TO weather;

-- What PostgreSQL program can be used to create a SQL file that contains the SQL commands needed to recreate the current structure and data of the weather table?

pg_dump -d sql-course -t weather --inserts > dump.sql

-- Modify all of the columns to be NOT NULL.

ALTER TABLE films ALTER COLUMN title SET NOT NULL;
ALTER TABLE films ALTER COLUMN year SET NOT NULL;
ALTER TABLE films ALTER COLUMN genre SET NOT NULL;
ALTER TABLE films ALTER COLUMN director SET NOT NULL;
ALTER TABLE films ALTER COLUMN duration SET NOT NULL;

-- Add a constraint to the table films that ensures that all films have a unique title.

ALTER TABLE films
ADD CONSTRAINT title_unique
UNIQUE (title);

-- Write a SQL statement to remove the constraint added in #4.

ALTER TABLE films
DROP CONSTRAINT title_unique;
ALTER TABLE

-- Add a constraint to films that requires all rows to have a value for title that is at least 1 character long.

ALTER TABLE films ADD CONSTRAINT title_length CHECK (length(title) >= 1);

-- What error is shown if the constraint created in #7 is violated? Write a SQL INSERT statement that demonstrates this.

INSERT INTO films VALUES ('', 1992, 'ask','him',2010)

-- Write a SQL statement to remove the constraint added in #7.

ALTER TABLE films DROP CONSTRAINT title_length;

-- Add a constraint to the table films that ensures that all films have a year between 1900 and 2100.

ALTER TABLE films ADD CONSTRAINT year_range CHECK (year BETWEEN 1900 AND 2100);

-- Add a constraint to films that requires all rows to have a value for director that is at least 3 characters long and contains at least one space character ().

ALTER TABLE films ADD CONSTRAINT director_name
    CHECK (length(director) >= 3 AND position(' ' in director) > 0);

-- Write an UPDATE statement that attempts to change the director for "Die Hard" to "Johnny". 
-- Show the error that occurs when this statement is executed.

UPDATE films
SET director = 'Johnny'
WHERE title = 'Die Hard';

-- List three ways to use the schema to restrict what values can be stored in a column.

Data type (which can include a length limitation)
NOT NULL Constraint
Check Constraint

-- Write a SQL statement that makes a new sequence called "counter".

CREATE SEQUENCE counter;

-- Write a SQL statement to retrieve the next value from the sequence created in #1.

SELECT nextval('counter');

-- Write a SQL statement that removes a sequence called "counter".

DROP SEQUENCE counter;

-- Is it possible to create a sequence that returns only even numbers? The documentation for sequence might be useful.

CREATE SEQUENCE even_counter INCREMENT BY 2 MINVALUE 2;

-- Write a SQL statement to add an auto-incrementing integer primary key column to the films table.

ALTER TABLE films
ADD COLUMN id serial PRIMARY KEY;

-- Write a SQL statement that modifies the table films to remove its primary key while preserving the id column and the values it contains.

ALTER TABLE films DROP CONSTRAINT films_pkey;

-- Write SQL statements that will insert the following films into the database:

-- title	year	genre	director	duration
-- Wayne's World	1992	comedy	Penelope Spheeris	95
-- Bourne Identity	2002	espionage	Doug Liman	118

INSERT INTO films (title, year, genre, director, duration) VALUES 
('Wayne''s World',	1992,	'comedy',	'Penelope Spheeris',	95),
('Bourne Identity',	2002,	'espionage',	'Doug Liman',	118);

-- Write a SQL query that lists all genres for which there is a movie in the films table.

SELECT DISTINCT genre FROM films;

-- Write a SQL query that returns the same results as the answer for #3, but without using DISTINCT.

SELECT genre FROM films GROUP BY genre;

-- Write a SQL query that determines the average duration across all the movies in the films table, rounded to the nearest minute.

SELECT round(avg(duration)) FROM films;

-- Write a SQL query that determines the average duration for each genre in the films table, rounded to the nearest minute.

SELECT genre, ROUND(AVG(duration)) FROM films GROUP BY genre;

-- Write a SQL query that determines the average duration of movies for each decade represented in the films table, 
-- rounded to the nearest minute and listed in chronological order.

SELECT (year/ 10 * 10) AS "decade", ROUND(AVG(duration)) AS "average_length" FROM films GROUP BY decade ORDER BY decade ASC;

-- Write a SQL query that finds all films whose director has the first name John.

SELECT * FROM films WHERE director LIKE 'John %';

-- Write a SQL query that will return the following data:
--    genre   | count
-- -----------+-------
--  scifi     |     5
--  comedy    |     4
--  drama     |     2
--  espionage |     2
--  crime     |     1
--  thriller  |     1
--  horror    |     1
--  action    |     1
-- (8 rows)

SELECT genre, count(id) FROM films GROUP BY genre ORDER BY count DESC;

-- Write a SQL query that will return the following data:
--  decade |   genre   |                  films
-- --------+-----------+------------------------------------------
--    1940 | drama     | Casablanca
--    1950 | drama     | 12 Angry Men
--    1950 | scifi     | 1984
--    1970 | crime     | The Godfather
--    1970 | thriller  | The Conversation
--    1980 | action    | Die Hard
--    1980 | comedy    | Hairspray
--    1990 | comedy    | Home Alone, The Birdcage, Wayne's World
--    1990 | scifi     | Godzilla
--    2000 | espionage | Bourne Identity
--    2000 | horror    | 28 Days Later
--    2010 | espionage | Tinker Tailor Soldier Spy
--    2010 | scifi     | Midnight Special, Interstellar, Godzilla
-- (13 rows)

SELECT (year/ 10 * 10) AS "decade", genre, string_agg(title, ', ') AS "films" FROM films GROUP BY decade, genre ORDER BY decade; 

-- Write a SQL query that will return the following data:
--    genre   | total_duration
-- -----------+----------------
--  horror    |            113
--  thriller  |            113
--  action    |            132
--  crime     |            175
--  drama     |            198
--  espionage |            245
--  comedy    |            407
--  scifi     |            632
-- (8 rows)

SELECT genre, sum(duration) AS "total_duration" FROM films GROUP BY genre ORDER BY total_duration;

-- Write a query that determines how many tickets have been sold.

SELECT count(id) FROM tickets;

-- Write a query that determines how many different customers purchased tickets to at least one event.

SELECT count(DISTINCT customer_id) FROM tickets;

-- Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

SELECT ROUND((100.0 * count(DISTINCT t.customer_id)/count(DISTINCT c.id)), 2) AS "percent" FROM tickets t, customers c;

SELECT round( COUNT(DISTINCT tickets.customer_id)
            / COUNT(DISTINCT customers.id)::decimal * 100,
            2)
       AS percent
  FROM customers
  LEFT OUTER JOIN tickets
    ON tickets.customer_id = customers.id;

-- Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

SELECT e.name, count(t.id) AS "popularity"
    FROM events e
    LEFT OUTER JOIN tickets t
        ON e.id = t.event_id
        GROUP BY e.name
        ORDER BY popularity DESC;

-- Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

SELECT c.id, c.email, count(DISTINCT t.event_id)
    FROM customers c
    JOIN tickets t
        ON c.id = t.customer_id 
        GROUP BY c.id
        HAVING count(DISTINCT t.event_id) = 3;

-- Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. 
-- The report should include the event name and starts_at and the seat's section name, row, and seat number.
--         event        |      starts_at      |    section    | row | seat
-- --------------------+---------------------+---------------+-----+------
--   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
--   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
--   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
--   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
-- (7 rows)


SELECT e.name AS "event", e.starts_at, sec.name, sea.row, sea.number AS "seat"
    FROM events e
    JOIN tickets t
        ON e.id = t.event_id
    JOIN seats sea
        ON t.seat_id = sea.id
    JOIN sections sec
        ON sea.section_id = sec.id
    JOIN customers c
        ON c.id = t.customer_id 
        WHERE c.email = 'gennaro.rath@mcdermott.co';

-- Update the orders table so that referential integrity will be preserved for the data between orders and products.

ALTER TABLE orders 
ADD CONSTRAINT orders_product_id_fkey 
FOREIGN KEY (product_id) REFERENCES products(id);

-- Use psql to insert the data shown in the following table into the database:
-- Quantity	Product
-- 10	small bolt
-- 25	small bolt
-- 15	large bolt

INSERT INTO products (name)
VALUES ('small bolt'), ('large bolt');

INSERT INTO orders (product_id, quantity)
VALUES (1, 10), (1, 25), (2, 15);

SELECT o.quantity, p.name FROM orders o JOIN products p ON p.id = o.product_id;

-- Can you insert a row into orders without a product_id? Write a SQL statement to prove your answer.

INSERT INTO orders (quantity) VALUES (0);

-- Write a SQL statement that will prevent NULL values from being stored in orders.product_id. What happens if you execute that statement?

ALTER TABLE orders
ALTER COLUMN product_id
SET NOT NULL;

-- Make any changes needed to avoid the error message encountered in #6.

DELETE FROM orders
WHERE quantity = 0;

-- Create a new table called reviews to store the data shown below. 
-- This table should include a primary key and a reference to the products table.
-- Product	Review
-- small bolt	a little small
-- small bolt	very round!
-- large bolt	could have been smaller

CREATE TABLE reviews (
    id serial PRIMARY KEY,
    body text NOT NULL,
    product_id integer REFERENCES products(id)
);

-- Write SQL statements to insert the data shown in the table in #8.

INSERT INTO reviews (body, product_id)
VALUES ('a little small', 1),
('very round!', 1),
('could have been smaller', 2);

-- Write a SQL statement to add the following call data to the database:
-- when	duration	first_name	last_name	number
-- 2016-01-18 14:47:00	632	William	Swift	7204890809

INSERT INTO calls ("when", duration, contact_id) VALUES ('2016-01-18 14:47:00',	632, 6);

-- Write a SQL statement to retrieve the call times, duration, and first name for all calls not made to William Swift.

SELECT calls."when", calls.duration, contacts.first_name FROM calls JOIN contacts ON contacts.id = calls.contact_id 
WHERE (contacts.first_name || ' ' || contacts.last_name) != 'William Swift';

-- Write SQL statements to add the following call data to the database:
-- when	duration	first_name	last_name	number
-- 2016-01-17 11:52:00	175	Merve	Elk	6343511126
-- 2016-01-18 21:22:00	79	Sawa	Fyodorov	6125594874

INSERT INTO contacts (first_name, last_name, "number") 
VALUES ('Merve', 'Elk', 6343511126),
('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls ("when", duration, contact_id)
VALUES
('2016-01-17 11:52:00',	175, 26),
('2016-01-18 21:22:00',	79, 27);

-- Add a constraint to contacts that prevents a duplicate value being added in the column number.

ALTER TABLE contacts
ADD CONSTRAINT number_unique
UNIQUE ("number");

-- Write a SQL statement that attempts to insert a duplicate number for a new contact but fails. What error is shown?

INSERT INTO contacts (first_name, last_name, "number") 
VALUES ('Ave', 'Littlemore', 6343511126);

-- The books_categories table from this database was created with foreign keys that don't have the NOT NULL and ON DELETE CASCADE constraints. 
-- Go ahead and add them now.

ALTER TABLE books_categories
ALTER COLUMN book_id SET NOT NULL,
ALTER COLUMN category_id SET NOT NULL,
DROP CONSTRAINT books_categories_book_id_fkey,
DROP CONSTRAINT books_categories_category_id_fkey,
ADD FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
ADD FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;

-- Write a SQL statement that will return the following result:
--  id |     author      |           categories
-- ----+-----------------+--------------------------------
--   1 | Charles Dickens | Fiction, Classics
--   2 | J. K. Rowling   | Fiction, Fantasy
--   3 | Walter Isaacson | Nonfiction, Biography, Physics
-- (3 rows)

SELECT b.id, b.author, string_agg(c.name, ', ') AS "categories" FROM books b JOIN books_categories bc
ON b.id = bc.book_id
JOIN categories c
ON bc.category_id = c.id
GROUP BY b.id ORDER BY b.id;

-- Write SQL statements to insert the following new books into the database. What do you need to do to ensure this data fits in the database?

-- Author	Title	Categories
-- Lynn Sherr	Sally Ride: America's First Woman in Space	Biography, Nonfiction, Space Exploration
-- Charlotte Brontë	Jane Eyre	Fiction, Classics
-- Meeru Dhalwala and Vikram Vij	Vij's: Elegant and Inspired Indian Cuisine	Cookbook, Nonfiction, South Asia

ALTER TABLE books ALTER COLUMN title TYPE text;

INSERT INTO books (author, title) VALUES
('Lynn Sherr',	'Sally Ride: America''s First Woman in Space'),
('Charlotte Brontë',	'Jane Eyre'),
('Meeru Dhalwala and Vikram Vij',	'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories (name) VALUES
('Space Exploration'), ('Cookbook'), ('South Asia');

INSERT INTO books_categories (book_id, category_id) VALUES
(4, 5),
(4, 1),
(4, 10),
(5, 2),
(5, 4),
(6, 11),
(6, 1),
(6, 12);

-- Write a SQL statement to add a uniqueness constraint on the combination of columns 
-- book_id and category_id of the books_categories table. This constraint should be a table constraint; 
-- so, it should check for uniqueness on the combination of book_id and category_id across all rows of the books_categories table.

ALTER TABLE books_categories
ADD UNIQUE (book_id, category_id);

-- Write a SQL statement that will return the following result:

--       name        | book_count |                                 book_titles
-- ------------------+------------+-----------------------------------------------------------------------------
-- Biography         |          2 | Einstein: His Life and Universe, Sally Ride: America's First Woman in Space
-- Classics          |          2 | A Tale of Two Cities, Jane Eyre
-- Cookbook          |          1 | Vij's: Elegant and Inspired Indian Cuisine
-- Fantasy           |          1 | Harry Potter
-- Fiction           |          3 | Jane Eyre, Harry Potter, A Tale of Two Cities
-- Nonfiction        |          3 | Sally Ride: America's First Woman in Space, Einstein: His Life and Universe, Vij's: Elegant and Inspired Indian Cuisine
-- Physics           |          1 | Einstein: His Life and Universe
-- South Asia        |          1 | Vij's: Elegant and Inspired Indian Cuisine
-- Space Exploration |          1 | Sally Ride: America's First Woman in Space

SELECT c.name, count(b.id) AS "book_count", string_agg(b.title, ', ') AS "book_titles"
FROM books b JOIN books_categories bc
ON b.id = bc.book_id
JOIN categories c
ON c.id = bc.category_id
GROUP BY c.name
ORDER BY c.name;

-- Write the SQL statement needed to create a join table that will allow a film to have multiple directors, 
-- and directors to have multiple films. Include an id column in this table, and add foreign key constraints to the other columns.

CREATE TABLE directors_films (
    id serial PRIMARY KEY,
    director_id integer NOT NULL REFERENCES directors(id) ON DELETE CASCADE,
    film_id integer NOT NULL REFERENCES films(id) ON DELETE CASCADE,
    UNIQUE(director_id, film_id)
);

-- Write the SQL statements needed to insert data into the new join table to represent the existing one-to-many relationships.

INSERT INTO directors_films (film_id, director_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 3), (8, 7), (9, 8), (10, 4);

-- Write a SQL statement to remove any unneeded columns from films.

ALTER TABLE films
DROP COLUMN director_id;

-- Write a SQL statement that will return the following result:
--            title           |         name
-- ---------------------------+----------------------
--  12 Angry Men              | Sidney Lumet
--  1984                      | Michael Anderson
--  Casablanca                | Michael Curtiz
--  Die Hard                  | John McTiernan
--  Let the Right One In      | Michael Anderson
--  The Birdcage              | Mike Nichols
--  The Conversation          | Francis Ford Coppola
--  The Godfather             | Francis Ford Coppola
--  Tinker Tailor Soldier Spy | Tomas Alfredson
--  Wayne's World             | Penelope Spheeris
-- (10 rows)

SELECT f.title, d.name FROM films f JOIN directors_films dc
ON f.id = dc.film_id
JOIN directors d
ON d.id = dc.director_id
ORDER BY f.title;

-- Write SQL statements to insert data for the following films into the database:
-- 
-- Film	Year	Genre	Duration	Directors
-- Fargo	1996	comedy	98	Joel Coen
-- No Country for Old Men	2007	western	122	Joel Coen, Ethan Coen
-- Sin City	2005	crime	124	Frank Miller, Robert Rodriguez
-- Spy Kids	2001	scifi	88	Robert Rodriguez

INSERT INTO films (title, "year", genre, duration)
VALUES 
('Fargo',	1996,	'comedy',	98),
('No Country for Old Men',	2007,	'western', 122),
('Sin City',	2005,	'crime', 124),
('Spy Kids',	2001,	'scifi',	88);

INSERT INTO directors ("name")
VALUES
('Joel Coen'), ('Ethan Coen'), ('Frank Miller'), ('Robert Rodriguez');

INSERT INTO directors_films (film_id, director_id) VALUES
(11, 9), (12, 9), (12, 10), (13, 11), (13, 12), (14, 12);

-- Write a SQL statement that determines how many films each director in the database has directed. 
-- Sort the results by number of films (greatest first) and then name (in alphabetical order).

SELECT d.name AS "director", count(f.id) AS "films" FROM films f JOIN directors_films dc
ON f.id = dc.film_id
JOIN directors d
ON d.id = dc.director_id
GROUP BY d.name
ORDER BY "films_directed" DESC, d.name ASC;

