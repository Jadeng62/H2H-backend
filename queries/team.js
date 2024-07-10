const db = require('../db/dbConfig')

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
  getAllTeams
};