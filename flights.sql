
-- CREATE TABLE airlines (
--   id int,
--   name varchar(255) DEFAULT NULL,
--   alias varchar(255) DEFAULT NULL,
--   iata varchar(255) DEFAULT NULL,
--   icao varchar(255) DEFAULT NULL,
--   callsign varchar(255) DEFAULT NULL,
--   country varchar(255) DEFAULT NULL,
--   active varchar(255) DEFAULT NULL
-- );

-- CREATE TABLE airports (
--   id int,
--   name varchar(255) DEFAULT NULL,
--   city varchar(255) DEFAULT NULL,
--   country varchar(255) DEFAULT NULL,
--   iata_faa varchar(255) DEFAULT NULL,
--   icao varchar(255) DEFAULT NULL,
--   latitude varchar(255) DEFAULT NULL,
--   longitude varchar(255) DEFAULT NULL,
--   altitude varchar(255) DEFAULT NULL,
--   utc_offset varchar(255) DEFAULT NULL,
--   dst varchar(255) DEFAULT NULL,
--   tz varchar(255) DEFAULT NULL
-- );

-- CREATE TABLE routes (
--   airline_code varchar(255) DEFAULT NULL,
--   airline_id int DEFAULT NULL,
--   origin_code varchar(255) DEFAULT NULL,
--   origin_id int DEFAULT NULL,
--   dest_code varchar(255) DEFAULT NULL,
--   dest_id int DEFAULT NULL,
--   codeshare varchar(255) DEFAULT NULL,
--   stops int DEFAULT NULL,
--   equipment varchar(255) DEFAULT NULL
-- );

-- SELECT SUM(quantity) AS total_inventory_count from products;
-- SELECT name, MIN(price) AS lowest_available_price
-- FROM products
-- GROUP BY name
-- ORDER BY lowest_available_price

COPY routes FROM '/Users/_kvn/code/wdi/w10/d03/SQL-practice/wdi-13-sql-airplane-lab/routes.csv' DELIMITER ',' CSV;
COPY airports FROM '/Users/_kvn/code/wdi/w10/d03/SQL-practice/wdi-13-sql-airplane-lab/airports.csv' DELIMITER ',' CSV;
COPY airlines FROM '/Users/_kvn/code/wdi/w10/d03/SQL-practice/wdi-13-sql-airplane-lab/airlines.csv' DELIMITER ',' CSV;

SELECT * FROM airports as origin 
WHERE origin.city ='New York';

SELECT * FROM airports as destination
WHERE destination.city = 'Paris';

SELECT * FROM routes WHERE origin_id IN ()

AND dest_id IN ()


SELECT * FROM routes WHERE origin_id 
IN (SELECT id FROM airports WHERE city ='New York')
AND dest_id IN ( SELECT id FROM airports WHERE city = 'Paris');


SELECT * FROM routes WHERE origin_id IN (SELECT id FROM airports as origin WHERE origin.city ='New York')
AND dest_id IN (SELECT id FROM airports as destination WHERE destination.city = 'Paris');