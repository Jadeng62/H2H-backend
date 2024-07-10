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
module.exports = {
  createNewUser,
  findUserByUID,
}
