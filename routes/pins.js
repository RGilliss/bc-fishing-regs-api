
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
    let query = `SELECT * FROM pins`;
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
  
//   router.put("/", (req, res) => {

//     const query = `
//     INSERT INTO pins (title, description, date, image, rating, location, species_id, user_id)
//     VALUES ($1, $2, $3, $4, $5, $6, $7, $8);`
//     let values = [req.body.title, req.body.description, req.body.date, req.body.image, req.body.rating, req.body.location, req.body.species.id]
    
//     db.query(query, values).then(results => {
//       const pinInformation = results.rows
//       console.log("success:", pinInformation)

//     .catch(err => {
//       res
//         .status(500)
//         .json({ error: err.message });
//     });

// //https://the-fish-net.herokuapp.com/pins

//   });

  return router;
};
