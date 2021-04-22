/*
 * All routes for Regulations are defined here
 * Since this file is loaded in server.js into /regulations,
 *   these routes are mounted onto /regulations
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */
const express = require('express');
const router  = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `SELECT * FROM regulations`;
    db.query(query, [])
      .then(results => {
        const regulations = results.rows;
        res.json({ regulations });
      })
      .catch(err => {
        res
          .status(500)
          .json({ error: err.message });
      });
  });
  return router;
};
