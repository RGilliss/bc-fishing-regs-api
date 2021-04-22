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
    let query = `SELECT pins.id, title, description, date, image, rating, location, species_name, uuid, favourite, user_id
    FROM pins;`;
    // console.log(query);
    db.query(query, [])
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
    const query = `
    INSERT INTO pins (title, description, date, image, rating, location, species_name, uuid, user_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);`;
    let values = [
      req.body.title,
      req.body.description,
      req.body.date,
      req.body.image,
      req.body.rating,
      req.body.location,
      req.body.species_name,
      req.body.uuid,
      req.body.user_id
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
    WHERE uuid = $1;`;

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

    SET title = $1,
        description = $2,
        date = $3,
        image = $4,
        rating = $5,
        species_name = $6
    WHERE uuid = $7;`;

    let values = [
      req.body.title,
      req.body.description,
      req.body.date,
      req.body.image,
      req.body.rating,
      req.body.species_name,
      req.body.uuid,
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
  router.patch("/", (req, res) => {
    const query = `
    UPDATE pins
    SET favourite = $1
    WHERE uuid = $2`;
    let values = [req.body.favourite, req.body.uuid];
    db.query(query, values)
      .then((results) => {
        console.log("success:", results);
        res.status(201).send("Favourite boolean changed");
      })
      .catch((err) => {
        console.log("error:", err);
        res.status(500).json({ error: err.message });
      });
  });

  return router;
};
