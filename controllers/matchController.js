const express = require('express')
const match = express.Router()
const { getAllMatches } = require('../queries/matches')

match.get('/', async (req,res) => {
    try {
        const allMatches = await getAllMatches();
        res.status(200).json(allMatches)
        
    } catch (error) {
        res.status(500).json({ error: 'Server error'})
    }
})

match.get('/:id', async (req,res) => {
    const { id } = req.params
    try {
        const allMatchesByID = await getAllMatches(id)
        if(allMatchesByID){
            res.status(200).json(allMatchesByID)
        }else{
            res.status(404).json({ error: `Match with this ID could not be found`})
        }
    } catch (error) {
        res.status(500).json({error: 'Server error'})
    }
})


module.exports = match
