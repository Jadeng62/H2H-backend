const express = require('express')
const auth = express.Router()
const authMiddleware = require('../middlewares/authMiddleware')
const { createNewUser, findUserByUID } = require('../queries/users.js')

auth.post('/register', async (req, res) => {
  const newUser = await createNewUser(req.body)

  if (newUser) {
    res.status(201).json(newUser)
  } else {
    res.status(500).json({ error: 'Error creating user' })
  }
})

auth.get('/user/:uid', authMiddleware, async (req, res) => {
  const { uid } = req.params

  const user = await findUserByUID(uid)

  if (user) {
    res.status(200).json(user)
  } else {
    res.status(500).json({ error: 'Error fetching user' })
  }
})

module.exports = auth
