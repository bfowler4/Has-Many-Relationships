DROP DATABASE IF EXISTS has_many_blogs;

DROP ROLE IF EXISTS has_many_user;

CREATE ROLE has_many_user;

CREATE DATABASE has_many_blogs OWNER has_many_user;

\c has_many_blogs

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id serial PRIMARY KEY,
  username character varying(90) NOT NULL,
  first_name character varying(90) default NULL,
  last_name character varying(90) default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id serial PRIMARY KEY,
  title character varying(180) default NULL,
  url character varying(510) default NULL,
  content text default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now(),
  user_id integer REFERENCES users(id)
);

CREATE INDEX index_user_id_on_posts ON posts (user_id);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
  id serial PRIMARY KEY,
  body character varying(510) default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now(),
  user_id integer REFERENCES users(id),
  post_id integer REFERENCES posts(id)
);

\i scripts/blog_data.sql