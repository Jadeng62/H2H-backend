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



const getAllTeams = async () => {
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

module.exports = {
  getAllTeams,
  createTeam
};