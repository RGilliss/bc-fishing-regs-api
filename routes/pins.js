
/*
 * All routes for Pins are defined here
 * Since this file is loaded in server.js into /pins,
 *   these routes are mounted onto /pins
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require('express');
const router  = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `SELECT pins.id, title, description, date, image, rating, location, user_id, users.name as name, species.name as species
    FROM pins
    JOIN users
    ON user_id = users.id
    JOIN species
    ON species_id = species.id;`;
    console.log(query);
    db.query(query, [])
      .then(results => {
        const pins = results.rows;
        res.json({ pins });
      })
      .catch(err => {
        res
          .status(500)
          .json({ error: err.message });
      });
  });
  return router;
};
