const express = require("express");
const bball = express.Router();
const bballData = require('../db/DPRBasketball.json');


bball.get("/", (req, res) => { // not necessary bc coming from json file, but good practice!
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


bball.get('/:id', (req, res) => {
  const { id } = req.params;
  const court = bballData[id]; // Use index as ID
  if (!court) {
    return res.status(404).json({ error: 'Court not found' });
  }
  res.json({ ...court, id });
});

module.exports = bball;