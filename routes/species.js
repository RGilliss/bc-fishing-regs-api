
/*
 * All routes for Species are defined here
 * Since this file is loaded in server.js into /species,
 *   these routes are mounted onto /species
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */
const express = require('express');
const router  = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `SELECT * FROM species`;
    console.log(query);
    db.query(query, [])
      .then(results => {
        const species = results.rows;
        res.json({ species });
      })
      .catch(err => {
        res
          .status(500)
          .json({ error: err.message });
      });
  });
  return router;
};
