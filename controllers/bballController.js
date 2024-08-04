const express = require("express");
const bball = express.Router();
const bballData = require('../db/DPRBasketball.json');


bball.get("/", (req, res) => {
  try {
    if (!bballData) {
      throw new Error('Basketball data not found');
    }   
    res.status(200).json(bballData);
  } catch (err) {
    console.error('Error fetching basketball data:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// First character of prop_id lets us know which borough the bball court is in
/* Boroughs:
X - Bronx
B - Brooklyn
M - Manhattan
Q - Queens
R - Staten Island
*/
bball.get("/:id", (req, res) => {
  const { id } = req.params;
  const playground = bballData.find(playground => playground.Prop_ID === id);
  if (!playground) {
    return res.status(404).json({ error: 'Playground not found' });
  }
  res.status(200).json(playground);
});

module.exports = bball;