const express = require("express");
const team = express.Router();
const {
  getAllTeams,
  createTeam,
  getTeamByTeamId,
  getTeamByPlayerId,
  updateTeam,
} = require("../queries/team");
const { getUsersByTeamID } = require("../queries/users");
const { checkAndAddBadgeToTeam } = require("../services/badgeService.js");

team.post("/", async (req, res) => {
  try {
    const newTeam = await createTeam(req.body);
    const teamId = newTeam.id; // created a binding to abbreviate teamID
    await checkAndAddBadgeToTeam(teamId, 1); // check if team unlocked a badge
    res.status(200).json(newTeam);
  } catch (error) {
    console.error("Error creating teams:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// team.post('/', async (req, res) => {
//   try {
//       const { team_name, team_pic, logo, captain_id } = req.body;
//       const newTeam = await createTeam({ team_name, team_pic, logo, captain_id });
//       res.status(200).json(newTeam);
//   } catch (error) {
//       console.error('Error creating team:', error);
//       res.status(500).json({ error: 'Internal server error' });
//   }
// });

team.put("/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const updatedTeam = await updateTeam(req.body, id);
    if (updatedTeam) {
      const teamId = id;
      await checkAndAddBadgeToTeam(teamId, 2); // check if team unlocked badge
      res.status(200).json(updatedTeam);
    } else {
      res
        .status(404)
        .json({ error: "Team with specified ID could not be updated" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

team.get("/", async (req, res) => {
  const { player_id } = req.query;

  if (player_id) {
    try {
      const oneTeam = await getTeamByPlayerId(player_id);
      if (oneTeam) {
        res.status(200).json(oneTeam);
      } else {
        res
          .status(404)
          .json({ error: "Team with specified player ID could not be found." });
      }
    } catch (error) {
      res.status(500).json({ error: "Internal server error" });
    }
  } else {
    try {
      const teams = await getAllTeams();
      res.json(teams);
    } catch (error) {
      console.error("Error fetching teams:", error);
      res.status(500).json({ error: "Internal server error" });
    }
  }
});

team.get("/:id/users", async (req, res) => {
  const { id } = req.params;
  try {
    const teamUsers = await getUsersByTeamID(id);
    console.log(teamUsers);
    if (teamUsers) {
      res.status(200).json(teamUsers);
    } else {
      res
        .status(404)
        .json({ error: "Could not find users for specified team ID" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

team.get("/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const oneTeam = await getTeamByTeamId(id);
    if (oneTeam) {
      res.status(200).json(oneTeam);
    } else {
      res
        .status(404)
        .json({ error: "Team with specified ID could not be found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = team;
