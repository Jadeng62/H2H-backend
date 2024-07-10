const db = require('../db/dbConfig')

const db = require('../db/dbConfig'); // Assuming dbConfig is correctly set up

const createTeam = async (id) => {
  try {
    const create = "SELECT ;";
     const newCaptin = await db.one(create);
       return create;
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

// make a query for users and teams (to show if they're part of a team)

module.exports = {
  getAllTeams,
  createTeam
};