SELECT * FROM series; 
SELECT * FROM reviwers; 
SELECT * FROM reviews; 

-- title | rating 
SELECT 
  title, 
  rating 
FROM series
INNER JOIN reviews 
  ON series.id = reviews.series_id;

-- title | avg_rating 
SELECT 
  title, 
  AVG(rating) AS avg_rating
FROM series
INNER JOIN reviews
  ON series.id = reviews.series_id
GROUP BY title
ORDER BY 2;

-- first_name | last_name | rating 
SELECT 
  first_name,
  last_name, 
  rating 
FROM reviewers
INNER JOIN reviews
  ON reviewers.id = reviews.reviewer_id;

-- Identify the unreviewed series 
SELECT
  title AS unreviewed_series
FROM series
  LEFT JOIN reviews
  ON series.id = reviews.series_id
WHERE rating IS NULL;

-- Genre | avg_rating 
SELECT
  genre,
  ROUND(
    AVG(rating), 
    2
  ) AS avg_rating
FROM series
  INNER JOIN reviews
  ON series.id = reviews.series_id
GROUP BY 1
ORDER BY 2;

-- first_name | last_name | COUNT | MIN rating | MAX rating | AVG | Status
SELECT 
  first_name, 
  last_name,
  IFNULL(COUNT(rating), 0) AS COUNT,
  IFNULL(MIN(rating), 0) AS MIN,
  IFNULL(MAX(rating), 0) AS MAX,
  ROUND(IFNULL(AVG(rating), 0), 2) AS AVG,
  CASE 
    WHEN COUNT(rating) >= 10 THEN 'Power User'
    WHEN COUNT(rating) > 0 THEN 'ACTIVE'
    ELSE 'INACTIVE' 
  END AS STATUS 
FROM reviewers
LEFT JOIN reviews
  ON reviewers.id = reviews.reviewer_id
GROUP BY last_name, first_name;

-- title | rating | reviewer : 
SELECT
  title, 
  rating, 
  CONCAT(first_name, ' ', last_name) as reviewer
FROM series 
INNER JOIN reviews 
  ON series.id = reviews.series_id
INNER JOIN reviewers
  ON reviews.reviewer_id = reviewers.id
ORDER BY 1, 2;