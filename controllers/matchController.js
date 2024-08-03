const express = require('express')
const match = express.Router()
const { getAllMatches, getAllMatchesByTeamID, getMatchByMatchID, getAllMatchesByPlayerID, createMatch, editMatch, deleteMatch } = require('../queries/matches')

const resultsController = require("./resultController")

match.use("/:match_id/results", resultsController)

match.get('/', async (req,res) => {
    const {team_id, player_id} = req.query
    // Route to get all matches for a specific team
    if(team_id){
        try {
            const allMatchesByTeam = await getAllMatchesByTeamID(team_id)
            if(allMatchesByTeam){
                res.status(200).json(allMatchesByTeam)
            }else{
                res.status(404).json({ error: 'Matches for specified Team could not be found.'})
            }
        } catch (error) {
            res.status(500).json({ error: 'Internal server error'})
        }
    }else if(player_id){
        try {
            const allMatchesByPlayer = await getAllMatchesByPlayerID(player_id)
            if(allMatchesByPlayer){
                res.status(200).json(allMatchesByPlayer)
            }else{
                res.status(404).json({ error: ' Matches for specified player could not be found'})
            }
        } catch (error) {
            res.status(500).json({error: 'Internal server error'})
        }
    }else{
        try {
            const allMatches = await getAllMatches();
            res.status(200).json(allMatches)
            
        } catch (error) {
            res.status(500).json({ error: 'Server error'})
        }   
    }
})

// Route to get ONE specific match by its match ID
match.get('/:id', async (req,res) => {
    const { id } = req.params
    try {
        const allMatchesByID = await getMatchByMatchID(id)
        if(allMatchesByID){
            res.status(200).json(allMatchesByID)
        }else{
            res.status(404).json({ error: `Match with this ID could not be found`})
        }
    } catch (error) {
        res.status(500).json({error: 'Server error'})
    }
})

match.post('/', async (req,res) =>{
    try {
        const newMatch = await createMatch(req.body)
        if(newMatch){
            res.status(200).json(newMatch)
        }else{
            res.status(404).json({ error: 'Match could not be created'})
        }
    } catch (error) {
        res.status(500).json({ error: 'Internal server error' })
    }
})

match.put('/:id', async (req,res) =>{
    const { id } = req.params
    try {
        const updatedMatch = await editMatch(req.body, id)
        if(updatedMatch){
            res.status(200).json(updatedMatch)
        }else{
            res.status(404).json({ error: 'Match with specified ID could not be updated'})
        }
    } catch (error) {
         console.log(error)
        res.status(500).json({ error: 'Internal server error'})
    }
})

match.delete("/:id", async (req, res) => {
    const {id} = req.params

     try {
        const deletedMatch = await deleteMatch(id)
         res.json(deletedMatch)
     } catch (err) {
        res.status(500).json({ error: 'Internal server error'})
     }
})

module.exports = match
