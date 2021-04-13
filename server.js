// Web server config
const PORT = process.env.PORT || 8080;
const ENV = process.env.ENV || "development";
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const cors = require('cors');

//Middleware
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// Connection to DB
const { Pool } = require('pg');
const connectionString = process.env.DATABASE_URL //Heroku ENV for DB
const db = new Pool({
  connectionString,
  ssl: {
    rejectUnauthorized: false
  }
})


// const { Pool } = require('pg');
// const dbParams = require('./lib/db.js');
// const db = new Pool(dbParams);
// db.connect();



db.connect(() => {
  console.log('connected to database');
});

// Separated Routes for each Resource
const usersRoutes = require("./routes/users");
const pinsRoutes = require("./routes/pins");
const regulationsRoutes = require("./routes/regulations");
const speciesRoutes = require("./routes/species");

// Mount all resource routes
app.use("/users", usersRoutes(db));
app.use("/pins", pinsRoutes(db));
app.use("/regulations", regulationsRoutes(db));
app.use("/species", speciesRoutes(db));

// Home page
app.get("/", (req, res) => {
  res.send('Hello!')
});




app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}`);
});
