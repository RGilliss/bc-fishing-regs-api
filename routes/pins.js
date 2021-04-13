
/*
 * All routes for Pins are defined here
 * Since this file is loaded in server.js into /pins,
 *   these routes are mounted onto /pins
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const { query } = require('express');
const express = require('express');
const router = express.Router();

//
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
        console.log(results.rows)
        const pins = results.rows;
        res.json( pins );
      })
      .catch(err => {
        console.log(err);
        res
          .status(500)
          .json({ error: err.message });
      });
  });


  router.post("/", (req, res) => {
    console.log("req", req.body)
    const query = `
    INSERT INTO pins (title, description, date, image, rating, location, species_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7);`
    let values = [req.body.title, req.body.description, req.body.date, req.body.image, req.body.rating, req.body.location, req.body.species]
    db.query(query, values).then(results => {
      const pinInformation = results.rows
      console.log("success:", pinInformation)
      res.send("success")
        .catch(err => {
          res
            .status(500)
            .json({ error: err.message });
        });

    })

  })
  return router
}
