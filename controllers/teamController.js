const express = require('express')
const team = express.Router()
const { getAllTeams } = require('../queries/team')

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