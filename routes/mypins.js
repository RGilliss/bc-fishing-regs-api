const { query } = require("express");
const express = require("express");
const router = express.Router();


module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `SELECT pins.id, title, description, date, image, rating, location, species_name, user_id, uuid
    FROM pins WHERE user_id = $1;`

    db.query(query, [req.query.user_id])
      .then((results) => {
        const mypins = results.rows;
        res.json(mypins);
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({ error: err.message });
      });
  });
  return router
}
