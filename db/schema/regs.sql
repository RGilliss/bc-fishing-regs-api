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
  location POINT
);

