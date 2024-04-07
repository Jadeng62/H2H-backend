// DEPENDENCIES
const cors = require("cors");
const express = require("express");

const authController = require("./controllers/authController");

// CONFIGURATION
const app = express();

// MIDDLEWARE
app.use(
  cors({
    origin: [
      "http://localhost:3000",
      "https://firebase-fullstack-auth-firestore.netlify.app",
    ],
  })
);
app.use(express.json());

app.use("/api/auth", authController);

// ROUTES
app.get("/", (_req, res) => {
  res.send("Welcome to Firebase Backend Server");
});

// 404 PAGE
app.get("*", (_req, res) => {
  res.status(404).send("Page not found");
});

// EXPORT
module.exports = app;
