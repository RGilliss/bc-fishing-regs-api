/*
 * All routes for Pins are defined here
 * Since this file is loaded in server.js into /pins,
 *   these routes are mounted onto /pins
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const { query } = require("express");
const express = require("express");
const router = express.Router();

//
module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `SELECT pins.id, title, description, date, image, rating, location, species_name
    FROM pins;`;
    console.log(query);
    db.query(query, [])
      .then((results) => {
        console.log(results.rows);
        const pins = results.rows;
        res.json(pins);
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({ error: err.message });
      });
  });

  router.post("/", (req, res) => {
    console.log("req", req.body);
    const query = `
    INSERT INTO pins (title, description, date, image, rating, location, species_name)
    VALUES ($1, $2, $3, $4, $5, $6, $7);`;
    let values = [
      req.body.title,
      req.body.description,
      req.body.date,
      req.body.image,
      req.body.rating,
      req.body.location,
      req.body.species,
    ];
    db.query(query, values)
      .then((results) => {
        console.log("success:", results);
      })
      .catch((err) => {
        res.status(500).json({ error: err.message });
      });
  });
  return router;
};
