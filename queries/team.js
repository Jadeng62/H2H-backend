const db = require('../db/dbConfig')

const db = require('../db/dbConfig'); // Assuming dbConfig is correctly set up

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
  getAllTeams
};