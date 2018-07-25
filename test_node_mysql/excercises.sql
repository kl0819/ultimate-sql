SELECT 
  DATE_FORMAT(MIN(created_at), "%M %D %Y") AS earliest_date
FROM users;

SELECT * 
FROM users 
WHERE created_at = (
  SELECT MIN(created_at) AS earliest_date
  FROM users
);

SELECT 
  MONTHNAME(created_at) as month,
  COUNT(*) as count
FROM users
GROUP BY month
ORDER BY 2 DESC; 

SELECT COUNT(*) as yahoo_users
FROM users 
WHERE email LIKE '%@yahoo.com';

SELECT 
  CASE 
    WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
    WHEN email LIKE '%@gmail.com' THEN 'gmail'
    WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
    ELSE 'other'
  END AS provider,
  COUNT(*) as total
FROM users 
GROUP BY provider;

