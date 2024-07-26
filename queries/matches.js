const db = require("../db/dbConfig");

const getAllMatches = async () => {
  try {
    const allMatches = await db.any("SELECT * FROM matches");
    return allMatches;
  } catch (error) {
    return error;
  }
};

const getMatchByMatchID = async (matchID) => {
  try {
    const query = "SELECT * FROM matches WHERE id=$1";
    const oneMatch = await db.one(query, matchID);
    return oneMatch;
  } catch (error) {
    throw error;
  }
};

const getAllMatchesByTeamID = async (teamID) => {
  try {
    const allMatches = await db.any(
      "SELECT * FROM matches WHERE team1_id=$1 OR team2_id=$1",
      [teamID]
    );
    return allMatches;
  } catch (error) {
    return error;
  }
};

const getAllMatchesByPlayerID = async (playerID) => {
  try {
    const query = `SELECT m.*
      FROM matches m
      JOIN team t ON m.team1_id = t.id OR m.team2_id = t.id
      WHERE t.point_guard_id = $1
        OR t.shooting_guard_id = $1
        OR t.small_forward_id = $1
        OR t.power_forward_id = $1
        OR t.center_id = $1;
    `;
    const allMatches = await db.any(query, [playerID]);
    return allMatches;
  } catch (error) {
    throw error;
  }
};

const createMatch = async (matchInfo) => {
  const {
    creator_id,
    team1_id,
    team2_id,
    park_name,
    address,
    borough,
    start_datetime,
    match_completed,
    match_winner,
    match_loser,
  } = matchInfo;

  console.log(matchInfo);

  try {
    const query = `
      INSERT INTO matches (creator_id, team1_id, park_name, address, borough,start_datetime, match_completed, match_winner, match_loser)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
      RETURNING *
    `;

    const newMatch = await db.one(query, [
      creator_id,
      team1_id,
      park_name,
      address,
      borough,
      start_datetime,
      match_completed,
      match_winner,
      match_loser,
    ]);

    return newMatch;
  } catch (error) {
    throw error;
  }
};

const editMatch = async (matchInfo, id) => {
  const {
    creator_id,
    team1_id,
    team2_id,
    address,
    state,
    city,
    zip,
    start_datetime,
    match_completed,
    match_winner,
    match_loser,
  } = matchInfo;

  try {
    const query = `
      UPDATE matches 
      SET creator_id=$1, team1_id=$2, team2_id=$3, address=$4, state=$5, city=$6, zip=$7, start_datetime=$8, match_completed=$9, match_winner=$10, match_loser=$11 
      WHERE id=$12 
      RETURNING *
    `;

    const updatedMatch = await db.one(query, [
      creator_id,
      team1_id,
      team2_id,
      address,
      state,
      city,
      zip,
      start_datetime,
      match_completed,
      match_winner,
      match_loser,
      id,
    ]);

    return updatedMatch;
  } catch (error) {
    throw error;
  }
};

const deleteMatch = async (id) => {
  try {
    const deletedMatch = await db.one(
      "DELETE FROM matches WHERE id=$1 RETURNING *",
      id
    );

    return deletedMatch;
  } catch (err) {
    throw err;
  }
};

module.exports = {
  getAllMatches,
  getMatchByMatchID,
  getAllMatchesByTeamID,
  getAllMatchesByPlayerID,
  createMatch,
  editMatch,
  deleteMatch,
};
