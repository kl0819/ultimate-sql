SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT 
  CONCAT_WS(' ', 
    author_fname, 
    author_lname
  ) AS "Unique Authors"
FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;