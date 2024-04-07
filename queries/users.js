const db = require("../db/dbConfig");

const createNewUser = async (user) => {
  const { id, email, username } = user;
  try {
    const newUser = await db.one(
      "INSERT INTO users (id, email, username) VALUES ($1, $2, $3) RETURNING *",
      [id, email, username]
    );
    return newUser;
  } catch (error) {
    console.log("Error creating user");
  }
};

const findUserByID = async (id) => {
  try {
    const query = "SELECT * FROM users WHERE id = $1";

    const user = await db.oneOrNone(query, id);

    return user;
  } catch (error) {
    console.error("Error finding user by username:", error);
    throw error;
  }
};
module.exports = {
  createNewUser,
  findUserByID,
};
