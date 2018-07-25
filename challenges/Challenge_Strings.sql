-- Reverse and Upper case this sentence: 'Why does my cat look at me with such hatred?'
SELECT 
  UPPER(
    REVERSE('Why does my cat look at me with such hatred?')
  );

-- SELECT 
--   REPLACE(
--     CONCAT('I', ' ', 'like', ' ', 'cats'), 
--     ' ', 
--     '-'
--   ); 
-- I-like-cats

-- Replace Spaces in the titles with '->'
SELECT 
  REPLACE(title, ' ', '->') 
  AS 'Title'
FROM books;

-- author last name forwards and backwards
SELECT
  author_lname AS 'forwards',
  REVERSE(author_lname) AS 'backwards'
FROM books;

-- Caps all letters full name
SELECT 
  CONCAT_WS(' ',
    UPPER(author_fname),
    UPPER(author_lname)
  ) AS 'full name in caps'
FROM books;

-- blurb
SELECT 
  CONCAT_WS(' ',
    title,
    'was released in',
    released_year
  ) AS 'Blurb'
FROM books;

-- Print book titles and length of each title 
SELECT title,
  CHAR_LENGTH(title) AS 'Character Count'
FROM books;

-- Short title (10x...), full author name (lname, fname), quantiy(x in stock)
SELECT 
  CONCAT(
    SUBSTRING(title, 1, 10),
    '...'
  ) as 'Short Title',
  CONCAT_WS(',', author_lname, author_fname) AS Author,
  CONCAT_WS(' ', stock_quantity, 'in stock') AS Quantity
FROM books;

