
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  avatar VARCHAR(255)
);

INSERT INTO users(name, email, avatar)
VALUES
('Tom Rosenbauer', 'Tom@orvis.com', 'https://farm9.staticflickr.com/8391/8492601202_d56e125aaf.jpg'),
('Alice Alison', 'alice@hotmail.com', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.epicscotland.com%2Fcorporate-headshot-tips%2F&psig=AOvVaw0zbtPe5IvRA0bwkIcFchKQ&ust=1618164500901000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDJ1tei9O8CFQAAAAAdAAAAABAO'),
('Alan Bodan', 'alan@hotmail.com', 'https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2014/12/fstoppers-dylan-patrick-setting-up-a-successful-headshot-session-8.jpg');

DROP TABLE IF EXISTS species CASCADE;

CREATE TABLE species (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

INSERT INTO species(name)
VALUES
('Steelhead Trout'),
('Rainbow Trout'),
('Cutthroat Trout'),
('Bull Trout'),
('Kokanee Salmon'),
('Smallmouth Bass'),
('White Sturgeon'),
('Yellow Perch'),
('Crayfish'),
('Char'),
('Coho Salmon'),
('Chinook Salmon'),
('Atlantic Salmon'),
('Pink Salmon'),
('Chum Salmon'),
('Sockeye Salmon');

DROP TABLE IF EXISTS pins CASCADE;

CREATE TABLE pins (
  id SERIAL PRIMARY KEY NOT NULL,
  uuid VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  date DATE,
  image VARCHAR(255),
  rating DECIMAL,
  location POINT NOT NULL,
  species_name VARCHAR(255),
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE
);

INSERT INTO pins(uuid, title, description, date, image, rating, location, species_name, user_id)
VALUES
('d27f0354-154f-4c23-ac1b-032e2df6489a','Alan''s Spot', 'Best spot ever, but be aware of the bears !', '2019-05-12', 'https://uwm.edu/field-station/wp-content/uploads/sites/380/2008/10/crayfish-1.jpg', 5, '(49.103729, -123.865096)', 'Rainbow Trout', 1),
('d27f0354-154f-4c23-ac1b-032e2df4564a','Harris Lake tail stream', 'Great spot to fish! lots of midges', '2020-06-24', 'https://i.imgur.com/BoQdQFA.jpg', 5, '(49.70093290199038, -125.39192512922456)', 'Rainbow Trout', 1),
('d27f0354-154f-4c23-ac1b-032e34f6464a','Alice''s favourite spot', 'This place is great. I go here every year.', '2018-12-12', 'https://i.imgur.com/WNbwwfR.jpg', 4.5, '(50.4678, -127.4090)', 'Rainbow Trout', 1),
('d27f0354-154f-4c23-ac1b-032e2236464a','Busy Stream', 'Way too many people fishing here', '2020-07-24', 'https://i.imgur.com/ZeDXXb3.jpg', 2, '(49.5, -125.39192512922456)', 'Rainbow Trout', 2),
('d27f0354-154f-4c23-ac1b-03122df6464a','Tom''s Sturgeon Spot', 'Lots of fish here!', '2020-06-27', 'https://i.imgur.com/SxP3Rfk.jpg', 4.5, '(49.5, -125.5)', 'Rainbow Trout', 2);
DROP TABLE IF EXISTS favourites CASCADE;

CREATE TABLE favourites (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  pin_id INTEGER REFERENCES pins (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS regulations CASCADE;

CREATE TABLE regulations (
  id SERIAL PRIMARY KEY NOT NULL,
  water_body VARCHAR(255) NOT NULL,
  class_water BOOLEAN DEFAULT FALSE,
  tributary BOOLEAN DEFAULT FALSE,
  stocked BOOLEAN DEFAULT FALSE,
  accessible BOOLEAN DEFAULT FALSE,
  date_range VARCHAR(255),
  regulation TEXT,
  location point
);

COPY regulations(water_body, class_water, tributary, stocked, accessible, date_range, regulation, location)
FROM '/vagrant/final/bc-fishing-regs-api/db/seeds/fishregswcoords.csv'
DELIMITER ','
CSV HEADER;
