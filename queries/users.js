const db = require('../db/dbConfig')

const createNewUser = async (user) => {
  const {id, uid, email, username, first_name, last_name, photo, dob, position } = user

  try {
    const newUser = await db.one(
      'INSERT INTO users (uid, email, username, first_name, last_name, photo, dob, position) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *',
      [id, uid, email, username, first_name, last_name, photo, dob, position]
    )

    return newUser
  } catch (error) {
    console.log('Error creating user', error)
  }
}

const findUserByUID = async (uid) => {
  try {
    const query = 'SELECT * FROM users WHERE uid = $1'

    const user = await db.oneOrNone(query, uid)

    return user
  } catch (error) {
    console.error('Error finding User By UID:', error)
    throw error
  }
}

const getUsersByTeamID = async (teamID) => {
  try {
    const query = `SELECT id, first_name, last_name, username, user_wins, user_losses, matches_played, photo, position
      FROM users
      WHERE id IN (
        SELECT point_guard_id FROM team WHERE id = $1
        UNION
        SELECT shooting_guard_id FROM team WHERE id = $1
        UNION
        SELECT small_forward_id FROM team WHERE id = $1
        UNION
        SELECT power_forward_id FROM team WHERE id = $1
        UNION
        SELECT center_id FROM team WHERE id = $1
        UNION
      );
    `
    const foundUsers = await db.any(query, teamID)
    return foundUsers
  } catch (error) {
    throw error
  }
}

const findUserByID = async (id) => {
  try {
    const query = "SELECT * FROM users WHERE id = $1";
    const user = await db.oneOrNone(query, [id]); // Pass id as an array

    return user;
  } catch (error) {
    console.error("Error finding User By ID:", error);
    throw error; // Make sure to throw the error to handle it in the calling code
  }
};
module.exports = {
  createNewUser,
  findUserByUID,
  getUsersByTeamID,
  findUserByID
}
