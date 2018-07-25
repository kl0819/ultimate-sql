-- Print the number of books in the database 
SELECT 
  COUNT(title) AS 'Number of books' 
FROM books;

-- Print out how many books were released each year 
SELECT 
  released_year AS Year, 
  Count(title) AS 'Number of books released'
FROM books
GROUP BY released_year
ORDER BY 1;

-- Total number of books in stock  
SELECT
  SUM(stock_quantity) as 'Total stock of all books'
FROM books;

-- Find the AVG released year for each author
SELECT 
  author_fname,
  author_lname,
  AVG(released_year)
FROM books
GROUP BY 1,2
ORDER BY 2,1;

-- Find the full name of the auhor who wrote the longest book
SELECT 
  CONCAT(author_fname, ' ', author_lname) AS Author,
  pages AS 'Longest Book(#pages)'
FROM books
WHERE pages = (SELECT MAX(pages)
              FROM books
              );

-- Make pic happen 
-- year | #of books | avg pages 
SELECT 
  released_year AS Year,
  COUNT(title) AS '# of books',
  AVG(pages) AS 'Avg Pages'
FROM books
GROUP BY 1
ORDER BY 1;