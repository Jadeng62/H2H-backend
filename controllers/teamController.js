const express = require('express')
const team = express.Router()
const { getAllTeams } = require('../queries/team')

module.exports = team;