// DEPENDENCIES
const cors = require('cors')
const express = require('express')

// const bballData = require('./db/DPRBasketball.json');
const authController = require('./controllers/authController')
const matchController = require('./controllers/matchController')
const teamController = require('./controllers/teamController');
const bballController = require('./controllers/bballController');
// CONFIGURATION
const app = express()

// MIDDLEWARE
app.use(cors())

app.use((req, _res, next) => {
  console.log('Origin Requested:', req.headers.origin)
  next()
})

app.use(express.json())


app.use('/api/auth', authController)
app.use('/api/teams', teamController)
app.use('/api/matches', matchController)
app.use('/api/bball', bballController)

// ROUTES
app.get('/', (_req, res) => {
  res.send('Welcome to Firebase Backend Server')
})

// 404 PAGE
app.get('*', (_req, res) => {
  res.status(404).send('Page not found')
})

// EXPORT
module.exports = app
