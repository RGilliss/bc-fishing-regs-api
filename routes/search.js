const express = require('express');
const router  = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    console.log("req.query", req.query.q)
    let query = `SELECT pins.id, title, description, date, image, rating, location, species_name, uuid
    FROM pins
    WHERE species_name = $1;`;
    db.query(query, [req.query.q])
      .then((results) => {
        console.log("species pins",results.rows);
        const pins = results.rows;
        res.json(pins);
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({ error: err.message });
      });
  });
  return router;
};
