-- Reward the loyal usesr. Find the oldest users 
-- users 
SELECT username, created_at
FROM users
ORDER BY created_at  
LIMIT 5; 

-- Figure out the best day to run an ad-campaign.
-- What day of the week do most users register on?
-- users 
SELECT 
  DAYNAME(created_at) as DAY,
  COUNT(*) as Total
FROM users
GROUP BY 1
ORDER BY 1 DESC
LIMIT 2;

-- Target inactive users with a email campaign 
-- Find the users who have never posted a photo 
-- users, photos 
SELECT username
FROM users 
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.id IS NULL; 

-- Find the user with the most likes on a single photo 
-- users(id), photos, likes

  -- count number of likes by photos & and get the MAX
  SELECT 
    photo_id,
    COUNT(*) as 'Number of Likes'
  FROM likes
  GROUP BY 1
  ORDER BY 2 DESC 
  LIMIT 1;

-- complete answer?
SELECT 
  username,
  photo_id,
  COUNT(*) AS 'Number of Likes',
  image_url
FROM users
INNER JOIN photos 
  ON users.id = photos.user_id
INNER JOIN likes
  ON photos.id = likes.photo_id
GROUP BY 2
ORDER BY 3 DESC
LIMIT 1;


-- How many time does an average user post?
  -- count how many posts there are
  SELECT 
    COUNT(id) AS 'Total Photos'
  FROM photos;
  -- count how many users there are 
  SELECT 
    COUNT(id) as 'Total Users'
  FROM users;
  -- combine & perform calculation 
  SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS 'Average'


-- What are the top 5 most commonly used hashtags?
SELECT 
  tag_name,
  tag_id,
  COUNT(*) AS Total
FROM photo_tags
JOIN tags 
  ON photo_tags.tag_id = tags.id
GROUP BY photo_tags.tag_id
ORDER BY 3 DESC, tag_name
LIMIT 5;

-- Find users whoh ave liked every single photo on the site 
-- users, likes, photos 
  -- # of total photos 
  SELECT 
    COUNT(*) AS 'Total # of Photos'
  FROM photos;

  -- complete answer?
SELECT
  username,
  COUNT(*) AS liked_photos
FROM users
JOIN likes 
  ON users.id = likes.user_id
-- JOIN photos 
--   ON likes.photo_id = photos.id 
GROUP BY likes.user_id
HAVING liked_photos = (SELECT COUNT(*) FROM photos);