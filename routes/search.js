const express = require('express');
const router  = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    console.log("req.query", req.query.q)
    let query = `
    SELECT pins.id, title, description, date, image, rating, location, species_name, uuid
    FROM pins
    WHERE to_tsvector(title || ' ' || species_name || ' ' || rating || ' '|| description) @@ plainto_tsquery($1);`;
    db.query(query, [req.query.q])
      .then((results) => {
        const pins = results.rows;
        res.json(pins);
      })
      .catch((err) => {
        res.status(500).json({ error: err.message });
      });
  });
  return router;
};
