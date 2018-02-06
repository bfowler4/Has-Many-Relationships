SELECT * 
FROM users;

SELECT * 
FROM posts 
WHERE user_id = 100;

SELECT posts.*, users.first_name, users.last_name 
FROM posts 
INNER JOIN users ON posts.user_id = users.id 
WHERE posts.user_id = 200;

SELECT posts.*, users.username 
FROM posts 
INNER JOIN users ON posts.user_id = users.id 
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT users.username 
FROM users 
INNER JOIN posts ON users.id = posts.user_id 
WHERE posts.created_at > timestamp '2015-01-01 00:00:00' 
GROUP BY users.username;

SELECT posts.title, posts.content, users.username
FROM posts
INNER JOIN users ON users.id = posts.user_id
WHERE users.created_at < timestamp '2015-01-01 00:00:00';

SELECT posts.title as "Post Title", comments.* 
FROM comments 
INNER JOIN posts on comments.post_id = posts.id;

SELECT posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at < timestamp '2015-01-01 00:00:00';

SELECT posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at > timestamp '2015-01-01 00:00:00';

SELECT posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%USB%';

SELECT posts.title as post_title, users.first_name, users.last_name, comments.body
FROM comments
INNER JOIN users ON comments.user_id = users.id
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%matrix%';

SELECT users.first_name, users.last_name, comments.body as comment_body
FROM comments
INNER JOIN users ON comments.user_id = users.id
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT
  users.username as comment_author_username, 
  comments.body as comment_body,
  uc.first_name as post_author_first_name,
  uc.last_name as post_author_last_name,
  posts.title as post_title
FROM posts
JOIN comments ON comments.post_id = posts.id
JOIN users ON comments.user_id = users.id
JOIN users uc ON posts.user_id = uc.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%'
ORDER BY users.first_name;




-- Additional queries
SELECT COUNT(*) FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at > timestamp '2015-07-14';

SELECT DISTINCT users.username 
FROM users
INNER JOIN comments ON comments.user_id = users.id
WHERE comments.body LIKE '%programming%';