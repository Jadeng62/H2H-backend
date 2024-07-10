const express = require('express')
const team = express.Router()
const { getAllTeams, createTeam } = require('../queries/team')


 team.post("/", async (req, res) => {
   console.log(req.body)
   try {
     const newTeam = await createTeam(req.body) 
      res.status(200).json(newTeam)
   } catch (error) {
    console.error('Error fetching teams:', error);
    res.status(500).json({ error: 'Internal server error' });
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