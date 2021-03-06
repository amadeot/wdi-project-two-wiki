DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS editors;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS articles_categories;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  password_digest VARCHAR,
  username VARCHAR,
  email VARCHAR);

CREATE TABLE editors(
  id INTEGER PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  article_id INTEGER REFERENCES articles(id),
  updated_at DATETIME);

CREATE TABLE articles(
  id INTEGER PRIMARY KEY,
  header VARCHAR,
  body_text TEXT,
  user_id INTEGER REFERENCES users(id),
  created_at DATETIME,
  updated_at DATETIME);

CREATE TABLE categories(
  id INTEGER PRIMARY KEY,
  name VARCHAR);

CREATE TABLE articles_categories(
  article_id REFERENCES articles(id),
  category_id REFERENCES categories(id));