CREATE TABLE user(
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  email VARCHAR,
  password ?);

CREATE TABLE article(
  id INTEGER PRIMARY KEY,
  header VARCHAR,
  body_text TEXT,
  author_id REFERENCES user(id)
  time_created TIME,
  edit_id REFERENCES user(id),
  time_edited TIME);

CREATE TABLE category(
  id INTEGER PRIMARY KEY,
  type VARCHAR,
  );

CREATE TABLE article_category(
  article(id),
  category(id));