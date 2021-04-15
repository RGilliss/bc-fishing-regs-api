const { query } = require("express");
const express = require("express");
const router = express.Router();


module.exports = (db) => {
  router.get("/", (req, res) => {
    let query = `SELECT pins.id, title, description, date, image, rating, location, species_name, user_id
    FROM pins WHERE user_id = 1;`
    // console.log(query);
    db.query(query, [])
      .then((results) => {
        console.log(results.rows);
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