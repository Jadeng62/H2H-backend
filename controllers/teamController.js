const express = require('express')
const team = express.Router()
const { getAllTeams,createTeam } = require('../queries/team')

 team.get("/:id", async (req, res) => {
    try {
        const captin = await createTeam();
         res.status(200).json(createTeam)
    } catch (err) {
        res.status(500).json({ error: 'Err with fetching captin id'})
    }
 })



team.get('/allteams', async (req, res) => {
  try {
    const teams = await getAllTeams();
    res.json(teams);
  } catch (error) {
    console.error('Error fetching teams:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = team;