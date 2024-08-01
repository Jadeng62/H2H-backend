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
    if (newBadge) {
      res.status(201).json(newBadge);
    } else {
      res.status(404).json({ error: "Badge could not be created" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

// GET Route for all badges a specified team has
badges.get("/teams/:teamId", async (req, res) => {
  const { teamId } = req.params;
  try {
    const badges = await getBadgesByTeamId(teamId);
    if (badges) {
      res.status(200).json(badges);
    } else {
      res
        .status(404)
        .json({ error: "Badges with specified team ID could not be found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

// GET Route for a badge by its ID
badges.get("/:badgeId", async (req, res) => {
  const { badgeId } = req.params;
  try {
    const badge = await getBadgeById(badgeId);
    if (badge) {
      res.status(200).json(badge);
    } else {
      res
        .status(404)
        .json({ error: "Badge with specified ID could not be found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

// GET Route for all badges
badges.get("/", async (req, res) => {
  try {
    const badges = await getAllBadges();
    if (badges) {
      res.status(200).json(badges);
    } else {
      res.status(404).json({ error: "No badges found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = badges;
