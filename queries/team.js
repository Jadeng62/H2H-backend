const db = require('../db/dbConfig')

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

module.exports = {
  getAllTeams,
  createTeam
};