const express = require("express");
const badges = express.Router();

const {
  addBadgeToTeam,
  getBadgesByTeamId,
  getBadgeById,
  getAllBadges,
} = require("../queries/badges");

// POST Route to add a badge to team badges
badges.post("/teams/:teamId/badges/:badgeId", async (req, res) => {
  const { teamId, badgeId } = req.params;
  try {
    const newBadge = await addBadgeToTeam(teamId, badgeId);
    res.status(201).json(newBadge);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// GET Route for all badges a specified team has
badges.get("/teams/:teamId", async (req, res) => {
  const { teamId } = req.params;
  try {
    const badges = await getBadgesByTeamId(teamId);
    res.status(200).json(badges);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// GET Route for a badge by its ID
badges.get("/:badgeId", async (req, res) => {
  const { badgeId } = req.params;
  try {
    const badge = await getBadgeById(badgeId);
    res.status(200).json(badge);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// GET Route for all badges
badges.get("/", async (req, res) => {
  try {
    const badges = await getAllBadges();
    res.status(200).json(badges);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = badges;
