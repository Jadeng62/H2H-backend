const db = require("../db/dbConfig");

const createNewUser = async (user) => {
  const { uid, email, username, first_name, last_name, photo, dob, position } = user;

  try {
    const newUser = await db.one(
      "INSERT INTO users (uid, email, username, first_name, last_name, photo, dob, position) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *",
      [uid, email, username, first_name, last_name, photo, dob, position]
    );
    return newUser;
  } catch (error) {
    throw new Error(`Failed to create user with UID ${uid}: ${error.message}`);
  }
};

const findUserByUID = async (uid) => {
  try {
    const query = "SELECT * FROM users WHERE uid = $1";
    const user = await db.oneOrNone(query, [uid]);
    return user;
  } catch (error) {
    throw new Error(`Failed to find user with UID ${uid}: ${error.message}`);
  }
};

const getUsersByTeamID = async (teamID) => {
  try {
    const query = `
      SELECT id, first_name, last_name, username, user_team_id, user_wins, user_losses, matches_played, photo, position
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
      );
    `;
    const foundUsers = await db.any(query, [teamID]);
    return foundUsers;
  } catch (error) {
    throw new Error(`Failed to retrieve users for team ID ${teamID}: ${error.message}`);
  }
};

const findUserByID = async (id) => {
  try {
    const query = "SELECT * FROM users WHERE id = $1";
    const user = await db.oneOrNone(query, [id]);
    return user;
  } catch (error) {
    throw new Error(`Failed to find user with ID ${id}: ${error.message}`);
  }
};

const deleteUserByID = async (id) => {
  try {
    const query = "DELETE FROM users WHERE id = $1 RETURNING *"; // Corrected query
    const user = await db.one(query, [id]);
    return user;
  } catch (error) {
    throw new Error(`Failed to delete user with ID ${id}: ${error.message}`);
  }
};

const updateTeamID = async (user_id, user_team_id) => {
  try {
    const query = "UPDATE users SET user_team_id=$1 WHERE id=$2 RETURNING *";
    const update = await db.one(query, [user_team_id, user_id]);
    return update;
  } catch (error) {
    throw new Error(`Failed to update team ID for user with ID ${user_id}: ${error.message}`);
  }
};

module.exports = {
  createNewUser,
  findUserByUID,
  getUsersByTeamID,
  findUserByID,
  deleteUserByID,
  updateTeamID,
};
