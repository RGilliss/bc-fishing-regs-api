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
    console.log("req URL", req.query.user_id);
    let query = `
    SELECT title, description, date, image, rating, location, species_name, uuid, favourite
    FROM pins
    WHERE user_id = $1;`;

    db.query(query, [req.query.user_id])
      .then((results) => {
        const pins = results.rows;
        res.json(pins);
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({ error: err.message });
      });
  });

  // router.patch("/", (req, res) => {
  //   const query = `
  //   UPDATE pins
  //   SET favourite = $1
  //   WHERE uuid = $2`;
  //   let values = [req.body.favourite, req.body.uuid];
  //   db.query(query, values)
  //     .then((results) => {
  //       console.log("success:", results);
  //       res.status(201).send("Favourite created");
  //     })
  //     .catch((err) => {
  //       console.log("error:", err);
  //       res.status(500).json({ error: err.message });
  //     });
  // });

  // router.delete("/", (req, res) => {
  //   const query = `
  //   UPDATE pins
  //   SET favourite = $1
  //   WHERE uuid = $2`;

  //   const values = [req.body.user, req.body.uuid];

  //   db.query(query, values)
  //     .then((results) => {
  //       console.log("success, favourite deleted:", results);
  //       res.status(200).send("Favourite was deleted");
  //     })
  //     .catch((err) => {
  //       console.log("error:", err);
  //       res.status(500).json({ error: err.message });
  //     });
  // });

  return router;
};
