const db = require('../db/dbConfig')

const createNewUser = async (user) => {
  const { uid, email, username, first_name, last_name, photo } = user

  try {
    const newUser = await db.one(
      'INSERT INTO users (uid, email, username, first_name, last_name, photo) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
      [uid, email, username, first_name, last_name, photo]
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
