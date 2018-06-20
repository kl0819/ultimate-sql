-- CRUD Challenge #1
-- Closet Inventory 
-- Create a shirts_db database, a shirts table, with shirt_id, article, color, shirt_size, and last_worn as columns.

SELECT database();

CREATE DATABASE shirts_db;

USE  shirts_db;

SELECT database();

-- Create a shirts table 
CREATE TABLE shirts(
  shirts_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  article VARCHAR(100),
  color VARCHAR(100),
  shirt_size VARCHAR(100),
  last_worn INT 
);

DESC shirts;
-- Add these 8 shirts to the table
INSERT INTO shirts
  (article, color, shirt_size, last_worn)
VALUES
  ('t-shirt', 'white', 'S', 10),
  ('t-shirt', 'green', 'S', 200),
  ('polo shirt', 'black', 'M', 10),
  ('tank top', 'blue', 'S', 50),
  ('t-shirt', 'pink', 'S', 0),
  ('polo shirt', 'red', 'M', 5),
  ('tank top', 'white', 'S', 200),
  ('tank top', 'blue', 'M', 15);

SELECT * FROM shirts;

-- Add a new Medium purple tshirt that was last worn 50 days ago 
INSERT INTO shirts
  (article, color, shirt_size, last_worn) 
VALUES ('t-shirt', 'purple', 'M', 50 );

--Select all shirts but only print out Article and Color Column 
SELECT article, color from shirts;

-- Select all medium shirts, but only print out everything but the shirt_id
Select article, color, shirt_size, last_worn 
FROM shirts 
WHERE shirt_size = 'M';

-- Update all polo shirts, change size to L 
SELECT * FROM shirts where article = 'polo shirt';
UPDATE shirts SET shirt_size = 'L'
WHERE article = 'polo shirt';

-- Update the shirt last worn 15 days ago to 0
SELECT * FROM shirts WHERE last_worn = 15;
UPDATE shirts SET last_worn = 0
WHERE last_worn = 15;

-- Update all the white shirts, change he size to xs and color to off white
SELECT * FROM shirts WHERE color = 'white';
UPDATE shirts SET color = 'off white', shirt_size = 'XS'
WHERE color = 'white';

-- Delete all old shirts, last_worn = 200
SELECT * FROM shirts WHERE last_worn = 200;
DELETE FROM shirts 
WHERE last_worn = 200;

-- Delete all tank tops
SELECT * FROM shirts WHERE article = 'tank top';
DELETE FROM shirts
WHERE article = 'tank top';

SELECT * FROM shirts
WHERE article = 'tank top';

SELECT * FROM shirts;

-- Delete all 
DELETE FROM shirts;

SELECT * FROM shirts;
-- Drop the shirts table entirely 
DROP TABLE shirts;

SHOW tables;

DESC shirts;