/*
 * All routes for Pins are defined here
 * Since this file is loaded in server.js into /pins,
 *   these routes are mounted onto /pins
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const { query } = require("express");
const express = require("express");
const router = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `SELECT pins.id, title, description, date, image, rating, location, species_name
    FROM pins;`;
    // console.log(query);
    db.query(query, [])
      .then((results) => {
        // console.log(results.rows);
        const pins = results.rows;
        res.json(pins);
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({ error: err.message });
      });
  });

  router.post("/", (req, res) => {
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
        res.status(201).send("Pin created");
      })
      .catch((err) => {
        console.log("error:", err);
        res.status(500).json({ error: err.message });
      });
  });

  router.delete("/", (req, res) => {
    const query = `
    DELETE FROM pins
    WHERE id = $1;`;

    db.query(query, [req.body.pinId])
      .then((results) => {
        console.log("success, pin deleted:", results);
        res.status(200).send("Pin was deleted");
      })
      .catch((err) => {
        console.log("error:", err);
        res.status(500).json({ error: err.message });
      });
  });

  router.put("/", (req, res) => {
    console.log("req", req.body);

    const query = `
    UPDATE pins
    SET title = $1
        description = $2
        date = $3
        image = $4
        rating = $5
        location = $6
        species_name = $7
    WHERE id = $8;`;

    let values = [
      req.body.title,
      req.body.description,
      req.body.date,
      req.body.image,
      req.body.rating,
      req.body.location,
      req.body.species,
      req.body.id,
    ];
    db.query(query, values)
      .then((results) => {
        console.log("success:", results);
        res.status(200).send("Pin was edited");
      })
      .catch((err) => {
        console.log("error:", err);
        res.status(500).json({ error: err.message });
      });
  });

  return router;
};
