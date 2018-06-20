SELECT 
  CONCAT(
    SUBSTRING(title, 1, 10), 
    '...'
  ) AS 'Short Title'
FROM books;

SELECT
  SUBSTRING(
    REPLACE(title, 'e', '3'), 
    1, 
    10
  ) AS 'Weird String'
FROM books;

-- Eggars is six characters long 
SELECT 
  CONCAT(
    author_lname, 
    ' is ',
    CHAR_LENGTH(author_lname),
    ' characters long.'
  ) AS "Last Name Length"
FROM books;

-- MY FAVORITE BOOK IS THE TITLE
SELECT 
  CONCAT(
    'MY FAVORITE BOOK IS ',
    UPPER(title)
  ) AS "Statment"
FROM books;

-- Books per year
SELECT
  CONCAT(
    'In ',
    released_year,
    ', ',
    COUNT(*),
    ' book(s) was released.'
  ) AS 'Total Per Year'
FROM books
GROUP BY released_year
ASC;

-- Find the year each author published their first book by 
SELECT author_fname, author_lname, MIN(released_year)
FROM books
GROUP BY 1,2
ORDER BY 2, 1;

-- Find the longest page count for each author
SELECT author_fname, author_lname, MAX(pages)
FROM books
GROUP BY 1,2
ORDER BY 2,1;

-- Calculate the average stock quantity for books released in the same year
SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY 1
ORDER BY 1;

-- avg pages for authors
SELECT 
  CONCAT(author_fname, ' ', author_lname)
    AS Author,
  AVG(pages) AS 'Average pages'
FROM books
GROUP BY author_lname, author_fname
ORDER by author_lname, author_fname;
