

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR (250) NOT NULL
);

DROP TABLE IF EXISTS species CASCADE;

CREATE TABLE species (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
);

INSERT INTO species(name)
VALUES
('steelhead_trout'),
('rainbow_trout'), 
('cutthroat_trout'), 
('bull_trout'),
('kokanee_salmon'),
('smallmouth_bass'),
('white_sturgeon'),
('yellow_perch'),
('crayfish'),
('char'),
('coho_salmon'),
('chinook_salmon'),
('atlantic_salmon'),
('pink_salmon'),
('chum_salmon'),
('sockeye_salmon');

DROP TABLE IF EXISTS pins CASCADE;

CREATE TABLE pins (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  date DATE,
  image VARCHAR(255),
  rating SMALLINT,
  latitude VARCHAR(255) NOT NULL,
  longitude VARCHAR(255) NOT NULL,
  species_id INTEGER REFERENCES species (id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE
);
