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



module.exports = team;