const db = require("../db/dbConfig");

const getAllMatches = async () => {
  try {
    const allMatches = await db.any("SELECT * FROM matches");
    return allMatches;
  } catch (error) {
    throw new Error(`Failed to retrieve all matches: ${error.message}`);
  }
};

const getMatchByMatchID = async (matchID) => {
  try {
    const query = "SELECT * FROM matches WHERE id=$1";
    const oneMatch = await db.one(query, matchID);
    return oneMatch;
  } catch (error) {
    throw new Error(`Failed to retrieve match with ID ${matchID}: ${error.message}`);
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
    throw new Error(`Failed to retrieve matches for team ID ${teamID}: ${error.message}`);
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
    throw new Error(`Failed to retrieve matches for player ID ${playerID}: ${error.message}`);
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

  try {
    const query = `
      INSERT INTO matches (creator_id, team1_id, park_name, address, borough, start_datetime, match_completed, match_winner, match_loser)
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
    throw new Error(`Failed to create match: ${error.message}`);
  }
};

const editMatch = async (matchInfo, id) => {
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

  try {
    const query = `
      UPDATE matches 
      SET creator_id=$1, team1_id=$2, team2_id=$3, park_name=$4, address=$5, borough=$6, start_datetime=$7, match_completed=$8, match_winner=$9, match_loser=$10
      WHERE id=$11
      RETURNING *
    `;

    const updatedMatch = await db.one(query, [
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
      id,
    ]);

    return updatedMatch;
  } catch (error) {
    throw new Error(`Failed to update match with ID ${id}: ${error.message}`);
  }
};

const deleteMatch = async (id) => {
  try {
    const deletedMatch = await db.one(
      "DELETE FROM matches WHERE id=$1 RETURNING *",
      id
    );

    return deletedMatch;
  } catch (error) {
    throw new Error(`Failed to delete match with ID ${id}: ${error.message}`);
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