const db = require("../db/dbConfig");

const createMatchResult = async (matchID) => {
    try {
        const query = 'INSERT into results (match_id) VALUES($1) RETURNING *';
        const createdResult = await db.one(query, [matchID]);
        return createdResult;
    } catch (error) {
        throw error;
    };
};

const getMatchResult = async (matchID) =>{
    try {
        const query = "SELECT * FROM results WHERE id=$1";
        const returnedResult = await db.one(query, [matchID]);
        return returnedResult;
    } catch (error) {
        throw error;
    };
};


module.exports = {
    createMatchResult,
    getMatchResult
};