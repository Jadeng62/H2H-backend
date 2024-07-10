const db = require('../db/dbConfig')

const createTeam = async (teamInfo) => {
   const {team_name, captain_id} = teamInfo 
    // console.log(teamInfo)
  try {
    const create = "INSERT INTO TEAM(team_name, captain_id) VALUES($1, $2) RETURNING *"
     const newTeam = await db.one(create, [team_name, captain_id]);
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