/*
 * All routes for Species are defined here
 * Since this file is loaded in server.js into /species,
 *   these routes are mounted onto /species
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */
const express = require("express");
const router = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    console.log("Get /species")
    let query = `SELECT * FROM species`;
    console.log(query);
    db.query(query)
      .then((results) => {
        console.log("This is then")
        const species = results.rows;
        res.json( species );
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({ error: err.message });
      });
  });
  return router;
};
