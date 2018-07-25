-- select all story collections 
SELECT title FROM books
WHERE title LIKE '%stories%';

-- Find the Longest Book 
SELECT title, pages FROM books
ORDER BY pages DESC LIMIT 1;

-- Print a summary containing the title and year for the 3 most recent books
SELECT 
  CONCAT(
    title, 
    ' - ',
    released_year
  ) AS Summary
FROM books
ORDER BY released_year DESC LIMIT 3;

-- Find all books with an author_lname that contains a space
SELECT title, author_lname 
FROM books
WHERE author_lname LIKE '% %';

-- Find the 3 books with the lowest stock 
SELECT title, released_year, stock_quantity 
FROM books
ORDER BY 3, 1 LIMIT 3;

-- Print title + author_lname. Sorted by author_lname and then by title
SELECT title, author_lname 
FROM books 
ORDER BY 2, 1;

-- Sorted alphabetically by last Name + follow the sample output
SELECT 
  CONCAT_WS(' ',
    'MY FAVORITE AUTHOR IS',
    UPPER(
      CONCAT(
        author_fname,
        ' ',
        author_lname
      )
    ),
    '!'
  ) AS yell
FROM books
ORDER BY author_lname;

