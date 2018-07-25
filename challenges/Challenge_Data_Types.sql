-- good use for char 
CREATE TABLE states(
  name VARCHAR(100),
  initial CHAR(2)
);

CREATE TABLE inventory(
  item_name VARCHAR(100),
  price DECIMAL(8, 2),
  quanity INT, 
);

-- DATETIME VS TIMESTAMP 
  -- differrent supported time periods, one is from 1970-2038, other is 1000-9999
  -- Size of memory, datetime 2x timestamp 
  -- in practice, timestamp is for adding metadata (updating or adding info)

-- Print out current time 
SELECT CURTIME();
-- Print out current date 
SELECT CURDATE();
-- Print out day of week, #
SELECT DATE_FORMAT(NOW(), '%w');
-- Print out the current day of the week, name 
SELECT DAYNAME(NOW);
SELECT DATE_FORMAT(NOW(), '%W');
-- Print out the current day and time using the format. mm/dd/yyyy
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

-- Print out the current day and time using this format. 'January 2nd at 3:15'
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

-- CREATE A TWEETS TABLE THAT STORES Tweet Content, Username, Time created 
CREATE TABLE tweets(
  content VARCHAR(250),
  username VARCHAR(20),
  created_at TIMESTAMP DEFAULT NOW()
);
