DROP TABLE IF EXISTS albums_table;
DROP TABLE IF EXISTS artists_table;

CREATE TABLE artists_table (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums_table (
  id SERIAL8 primary key,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT8 references artists_table(id)
);