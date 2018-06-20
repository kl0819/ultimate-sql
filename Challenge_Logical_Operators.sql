SELECT 10 != 10;
-- False (0)
SELECT 15 > 14 && 99 - 5 <= 94;
-- True (1)
SELECT 1 IN (5, 3) || 9 BETWEEN 8 AND 10;
-- True (1)

-- Select books written before 1980 (non inclusive)
SELECT title, released_year
FROM books 
WHERE released_year < 1980;

-- Select books written by Eggers or Chabon 
SELECT title, author_lname
FROM books 
WHERE author_lname IN ('Eggers', 'Chabon');

-- Select ALL books written by Lahiri, published after 2000
SELECT title, author_lname, released_year 
FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

-- Select ALL books wiht page counts between 100 and 200
SELECT title, pages
FROM books 
WHERE pages BETWEEN 100 AND 200;

-- Select all books where author_lname starts with a 'C' or an 'S'
SELECT title, author_lname
FROM books 
WHERE author_lname LIKE 'C%' OR 
      author_lname LIKE 'S%';

-- If title contains 'stories' -> Short Stories 
-- Just kids and a heartbreaking work -> Memoir
-- Else -> Novel 
SELECT title, author_lname, 
  CASE 
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title LIKE '%Just Kids%' OR title Like '%A Heartbreaking Work%' THEN 'Memoir'
    ELSE 'Novel'
  END AS 'TYPE'
FROM books;

-- Make this happen
SELECT title, author_lname, 
  CASE 
    WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' books')
  END AS COUNT
FROM books
GROUP BY 2, author_fname
ORDER BY 2;
