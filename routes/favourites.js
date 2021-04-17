/*
 * All routes for Favourites are defined here
 * Since this file is loaded in server.js into /pins,
 *   these routes are mounted onto /pins
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const { query } = require("express");
const express = require("express");
const router = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `
    SELECT pins.id, title, description, date, image, rating, location, species_name
    FROM favourites
    JOIN pins
    ON favourites.pin_id = pins.id
    WHERE pins.user_id = $1;`;

    db.query(query, [req.body.id])
      .then((results) => {
        const pins = results.rows;
        res.json(pins);
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({ error: err.message });
      });
  });

  router.post("/", (req, res) => {
    console.log("req.body", req);
    const query = `
    INSERT INTO favourites (user_id)
    VALUES ($1);`;
    let values = [req.body.user_id];
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
    DELETE FROM favourites
    WHERE user_id = $1
    AND uuid = $2;`;

    const values = [req.body.user_id, req.body.uuid]

    db.query(query, values)
      .then((results) => {
        console.log("success, favourite deleted:", results);
        res.status(200).send("Favourite was deleted");
      })
      .catch((err) => {
        console.log("error:", err);
        res.status(500).json({ error: err.message });
      });
  });

  return router;
};
