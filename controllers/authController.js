const express = require('express')
const auth = express.Router()
const authMiddleware = require('../middlewares/authMiddleware')
const { createNewUser, findUserByID } = require('../queries/users.js')

auth.post('/register', async (req, res) => {
  // console.log('register', req.body)
  const newUser = await createNewUser(req.body)

  if (newUser) {
    res.status(201).json(newUser)
  } else {
    res.status(500).json({ error: 'Error creating user' })
  }
})

auth.get('/user/:uid', authMiddleware, async (req, res) => {
  const { uid } = req.params
  console.log('getUser', uid)
  const user = await findUserByID(uid)

  if (user) {
    res.status(200).json(user)
  } else {
    res.status(500).json({ error: 'Error fetching user' })
  }
})

module.exports = auth
