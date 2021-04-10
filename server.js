// load .env data into process.env
require("dotenv").config();

// Web server config
const PORT = process.env.PORT || 8080;
const ENV = process.env.ENV || "development";
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const cors = require('cors');

app.use(cors());

//CONNECTION TO DB
const { Pool } = require('pg');
const connectionString = process.env.DATABASE_URL //HEROKU ENV FOR DB
const db = new Pool({
  connectionString,
  ssl: {
    rejectUnauthorized: false
  }
})

db.connect(() => {
  console.log('connected to database');
});

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

// Separated Routes for each Resource
// Note: Feel free to replace the example routes below with your own
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
  res.render("index");
});


app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}`);
});
