// Web server config
require("dotenv").config();
const PORT = process.env.PORT || 8000;
const ENV = process.env.ENV || "development";
const express = require("express");
const app = express();

//Middleware
app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  next();
});

app.use(express.json());
app.use(express.static("public"));

//DB params
const { Pool } = require("pg");
const dbParams = require("./lib/db.js");
console.log(dbParams);
const db = new Pool(dbParams);

db.connect(() => {
  console.log("connected to database");
});

// Separated Routes for each Resource
const usersRoutes = require("./routes/users");
const pinsRoutes = require("./routes/pins");
const regulationsRoutes = require("./routes/regulations");
const speciesRoutes = require("./routes/species");
const searchRoutes = require("./routes/search");

// Mount all resource routes
app.use("/users", usersRoutes(db));
app.use("/pins", pinsRoutes(db));
app.use("/regulations", regulationsRoutes(db));
app.use("/species", speciesRoutes(db));
app.use("/search", searchRoutes(db));

// Home page
app.get("*", (req, res) => {
  res.send("Hello!");
});

app.listen(PORT, () => {
  console.log(`The Net listening on port ${PORT}`);
});
