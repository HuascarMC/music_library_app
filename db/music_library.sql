DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(225),
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(225),
  genre VARCHAR(225),
  artist_id INT8 REFERENCES artists(id)
);
