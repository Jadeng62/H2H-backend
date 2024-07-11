const db = require('../db/dbConfig')

const getAllMatches = async () => {
    try {
      const allMatches = await db.any(
        'SELECT * FROM matches'
      )
      return allMatches
    } catch (error) {
      return error
    }
}

const getMatchByMatchID = async (matchID) =>{
  try {
    const query = 'SELECT * FROM matches WHERE id=$1'
    const oneMatch =  await db.one(query,matchID)
    return oneMatch
  } catch (error) {
    throw error
  }
}

const getAllMatchesByTeamID = async (teamID) => {
  try {
    const allMatches = await db.any(
      'SELECT * FROM matches WHERE team1_id=$1 OR team2_id=$1',
      [teamID]
    )
    return allMatches
  } catch (error) {
    return error
  }
}

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
    `
    const allMatches = await db.any(query, [playerID])
    return allMatches
  } catch (error) {
    throw error
  }
}

module.exports = {
  getAllMatches,
  getMatchByMatchID,
  getAllMatchesByTeamID,
  getAllMatchesByPlayerID
}
