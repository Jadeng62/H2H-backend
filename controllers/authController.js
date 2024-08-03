const express = require("express");
const auth = express.Router();
const authMiddleware = require("../middlewares/authMiddleware");
const {
  createNewUser,
  findUserByUID,
  deleteUserByID,
  updateTeamID,
  findUserByID,
} = require("../queries/users.js");

auth.post("/register", async (req, res) => {
  console.log('attempting to create user: ',req.body)
  const newUser = await createNewUser(req.body);

  if (newUser) {
    res.status(201).json(newUser);
  } else {
    res.status(500).json({ error: "Error creating user" });
  }
});

auth.get("/user/:uid", authMiddleware, async (req, res) => {
  const { uid } = req.params;
  const user = await findUserByUID(uid);
  if (user) {
    res.status(200).json(user);
  } else {
    res.status(500).json({ error: "Error fetching user" });
  }
});

auth.get("/user/single/:id", async (req, res) => {
  const { id } = req.params;
  const user = await findUserByID(id);
  if (user) {
    res.status(200).json(user);
  } else {
    res.status(500).json({ error: "Error fetching user" });
  }
});

auth.delete("user/:id", async (req, res) => {
  const { id, uid } = req.params;
  const user = await deleteUserByID(id);

  return res.status(200) ? res.status(200) : res.status(404);
});

auth.put("/user/:id", async (req, res) => {
  const { id } = req.params;
  const { user_team_id } = req.body;

  console.log("Received user_team_id:", user_team_id);

  try {
    const userTeamID = await updateTeamID(id, user_team_id);
    if (userTeamID) {
      res.status(200).json(userTeamID);
    } else {
      res.status(400).json({ message: "Failed to update user_team_id" });
    }
  } catch (error) {
    console.error("Error in PUT /user/:id route:", error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

module.exports = auth;
