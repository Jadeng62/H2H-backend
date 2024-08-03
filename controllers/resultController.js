const express = require("express");
const results = express.Router({mergeParams:true});
const {createMatchResult, getMatchResult} = require("../queries/results")
const {getMatchByMatchID} = require("../queries/matches")


results.get('/', async (req,res) =>{
    const {match_id} = req.params;
    try {
        const returnedResult = await getMatchResult(match_id);
        const returnedMatch = await getMatchByMatchID(match_id);
        if(returnedResult && returnedMatch){
            const returnedMatchWithResult = {
                Match: returnedMatch,
                Result: returnedResult
            };
            res.status(200).json(returnedMatchWithResult);
        }else{
            res.status(404).json({error: 'Match with specified ID could not be found'});
        };
    } catch (error) {
        res.status(500).json({error: 'Internal server error'});
    };
});

results.post('/', async (req,res) =>{
    const {match_id} = req.body;
    try {
        const createdResult = await createMatchResult(match_id);
        if(createdResult){
            res.status(200).json(createdResult);
        }else{
            res.status(404).json({error: 'Could not create result'});
        };
    } catch (error) {
        res.status(500).json({error: 'Internal server error'});
    };
});

module.exports = results