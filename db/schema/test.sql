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
  favourite BOOLEAN DEFAULT FALSE,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE
);


INSERT INTO pins(uuid, title, description, date, image, rating, location, species_name, favourite, user_id)

VALUES
('d27f0354-154f-4c23-ac1b-032e2df6464a','Alan''s Spot', 'Best spot ever, lot''s of Crayfish!', '2019-05-12', 'https://uwm.edu/field-station/wp-content/uploads/sites/380/2008/10/crayfish-1.jpg', 5, '(49.13226662601794, -123.90715840187138)', 'Crayfish', 'true', 1),
('d27f0354-154f-4c23-ac1b-032g2df6464a','Harris Lake tail stream', 'Great spot to fish! lots of midges', '2020-06-24', 'https://i.imgur.com/BoQdQFA.jpg', 5, '(49.70093290199038, -125.39192512922456)', 'Rainbow Trout', 'false', 1),
('d27f0354-154f-4t23-ac1b-032e2df6464a','Alice''s favourite spot', 'I once caught a rare trout here.', '2018-12-12', 'https://i.imgur.com/WNbwwfR.jpg', 4.5, '(50.4678, -127.4090)', 'Rainbow Trout', 'true', 1),
('d27f0354-154f-4c23-as1b-032e2df6464a','Busy Stream', 'This stream is packed with people. If you want a quiet palce to fish don''t come here.', '2020-07-24', 'https://i.imgur.com/ZeDXXb3.jpg', 2, '(49.671031491920736, -125.07155679741705)', 'Smallmouth Bass', 'false', 2),
('d27d0354-154f-4c23-ac1b-032e2df6464a','Tom''s Sturgeon Spot', 'We caught one big stugeon! It took 4 hours to reel in', '2020-06-27', 'https://i.imgur.com/SxP3Rfk.jpg', 4.5, '(48.88671181035786, -124.30174686342835)', 'White Sturgeon', 'true', 2),
('d27d0324-154w-4c23-ac1b-032e2df6464a','Brooke''s Babbling Brook', 'Right down the street from my house. Enjoy and please pack out what you pack in :)', '2020-05-27', 'https://i.imgur.com/OpgJSiS.jpeg', 4, '(50.227454, -125.262000)', 'Char', 'false', 1),
('f22e1344-111d-4cs3-ac1d-042e6df6464a','Great Bear Lake', 'What an incredible fishing spot. I can''t believe no one else is here. Caught a huge sal-AAAAHHHHHHHHHHHHHH', '2021-02-14', 'https://i.imgur.com/LZ1Xa9r.jpg', 5, '(66.000000, -121.000000)', 'Sockeye Salmon', 'false', 1),
('f33e1344-123d-4cs3-ac4d-049e5df6164b','My First Fish!', 'I had so much fun fishing for the first time. I even caught one! We cooked it on the campfire by Dad burned it!', '2020-07-17', 'https://i.imgur.com/nRXNpeX.jpg', 2, '(48.54948584512921, -123.71336356781634)', 'Smallmouth Bass', 'false', 3),
('f42e1123-123d-1as3-ac1f-048e6df6464a','Kilgore Trout''s Trout', 'Caught the biggest trout of my life. What a beaut. Catch and release. Got the picture though for bragging rights.', '2021-09-19', 'https://i.imgur.com/a1IuesO.jpg', 3, '(50.1793282146136, -127.26262532463824)', 'Rainbow Trout', 'true', 1),
('f22e1344-111d-4cs3-ac2d-047k3hjf6464a','Beautiful spot for winter steelhead fishing', 'The old man outfished me but it was still fun! We will be back next year.', '2021-01-20', 'https://i.imgur.com/BD1DcNL.jpg', 5, '(50.36989735984054, -126.7782508235241)', 'Steelhead Trout', 'True', 2),
('f22e1344-111d-4cs3-ac2d-045k3hsjt73a','Coho Crazy', 'We couldn''t keep the coho salmon off the line! We took two home that were delicious!!', '2020-08-20', 'https://i.imgur.com/9HLcq32.jpg', 4.5, '(49.8068518493773, -126.37709945733194)', 'Coho Salmon', 'True', 2),
('w34f9354-128f-4c98-ac1r-032g2df23464a','Ye Olde Fishing Hole', 'Popular spot in the 1950s. Only memories here now', '1950-06-24', 'https://imgur.com/gallery/GSVZXVs', 2.5, '(51.4037541178298, -127.04931576774683)', 'Kokanee Salmon', 'false', 3),
('d27f0354-154f-4c23-ac1b-034r2df6464a','Love at first sight', 'I spent all my summer fishing at that spot! Beautiful and so lot''s of fish', '2020-09-12', 'https://wdfw.wa.gov/sites/default/files/styles/page_body_half_width/public/2019-02/1386.jpg?itok=ly12l6JP', 5, '(48.99346855859876, -124.8893252591782)', 'Chinook Salmon', 'true', 1),
('f22jksdf4-111d-4cs3-ac2d-045k3hsjt73a','Grandad''s Tricks', 'We caught a fish with the strangest teeth! Other than that there are not many fish here. Be aware of black bears, saw a sow with cubs across the lake', '2020-06-23', 'https://i.imgur.com/HlLMv8A.jpg', 3, '(49.73491911469184, -125.56589164451103)', 'Char', 'false', 2),
('sfddksdf4-111d-4cs3-ac2d-045k3hsjt73a','Almost got my first trout!', 'A wonderful, quiet are with load of wildlife! I almost caught a trout but lost it at the last second.', '2020-06-23', 'https://i.imgur.com/qPMcGHI.jpeg', 4, '(49.47667440340716, -125.26263224717492)', 'Bull Trout', 'false', 2);

-- DROP TABLE IF EXISTS favourites CASCADE;

-- CREATE TABLE favourites (
--   id SERIAL PRIMARY KEY NOT NULL,
--   user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
--   pin_id INTEGER REFERENCES pins (id) ON DELETE CASCADE,
--   pin_uuid VARCHAR(255) NOT NULL
-- );

-- INSERT INTO favourites(user_id, pin_id, pin_uuid)
-- VALUES(1, 1, 'd27f0354-154f-4c23-ac1b-032e2df6464a');

DROP TABLE IF EXISTS regulations CASCADE;

CREATE TABLE regulations (
  id SERIAL PRIMARY KEY NOT NULL,
  water_body VARCHAR(255) NOT NULL,
  class_water BOOLEAN DEFAULT FALSE,
  tributary BOOLEAN DEFAULT FALSE,
  stocked BOOLEAN DEFAULT FALSE,
  accessible BOOLEAN DEFAULT FALSE,
  regulation TEXT,
  location point,
  size_water point,
  circle_size VARCHAR(255),
  reg_colour VARCHAR(255)
);


COPY regulations(water_body, class_water, tributary, stocked, accessible, regulation, location, size_water, circle_size, reg_colour)
FROM '/vagrant/final/bc-fishing-regs-api/db/seeds/fishregs.csv'

DELIMITER ','
CSV HEADER;