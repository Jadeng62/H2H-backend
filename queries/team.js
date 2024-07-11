const db = require('../db/dbConfig')

const createTeam = async (teamInfo) => {
   const {team_name, captain_id, captain_position} = teamInfo 
    // console.log(teamInfo)
  try {
    const query = `INSERT INTO TEAM(team_name, captain_id, ${captain_position}_id) VALUES($1, $2, $3) RETURNING * `
     const newTeam = await db.one(query, [team_name, captain_id, captain_id]);
       return newTeam;
  } catch (err) {;
    throw new Error(err)
  }
}



const getAllTeams = async (id) => {
    try {
      const query = `
        SELECT * FROM team;
      `;
      const allTeams = await db.any(query);
      return allTeams;
    } catch (error) {
      throw error;
    }
};

const getTeamByTeamId = async (id) =>{
  try {
    const query = 'SELECT * FROM team WHERE id=$1'
    const oneTeam = await db.one(query, [id])
    return oneTeam
  } catch (error) {
    throw error
  }
}

const getTeamByPlayerId = async (player_id) =>{
  try {
    const query = 'SELECT * FROM team WHERE point_guard_id = $1 OR shooting_guard_id = $1 OR small_forward_id = $1 or power_forward_id = $1 OR center_id = $1'
    const oneTeam = await db.one(query, Number(player_id))
    return oneTeam
  } catch (error) {
    throw error
  }
}
module.exports = {
  getAllTeams,
  createTeam,
  getTeamByTeamId,
  getTeamByPlayerId
};