const db = require("../db/dbConfig");

const addBadgeToTeam = async (team_id, badge_id) => {
  try {
    // check if badge for a specific team already exists
    const checkQuery = `
      SELECT * 
      FROM team_badges 
      WHERE team_id = $1 AND badge_id = $2
    `;
    const existingBadge = await db.oneOrNone(checkQuery, [team_id, badge_id]);

    if (existingBadge) {
      throw new Error("Badge already awarded to this team");
    }

    const query =
      "INSERT INTO team_badges (team_id, badge_id) VALUES ($1, $2) RETURNING *";
    const newBadge = await db.one(query, [team_id, badge_id]);
    return newBadge;
  } catch (error) {
    throw new Error(error.message || error);
  }
};

const getBadgesByTeamId = async (team_id) => {
  try {
    const query = `
      SELECT badges.*
      FROM team_badges
      JOIN badges ON team_badges.badge_id = badges.id
      WHERE team_badges.team_id = $1
    `;
    const badges = await db.any(query, [team_id]);
    return badges;
  } catch (err) {
    throw new Error(err.message || err);
  }
};

const getBadgeById = async (badge_id) => {
  try {
    const query = `
            SELECT * 
            FROM badges 
            WHERE id = $1
        `;
    const badge = await db.one(query, [badge_id]);
    return badge;
  } catch (err) {
    throw new Error(err.message || err);
  }
};

const getAllBadges = async () => {
  try {
    const query = `
            SELECT * 
            FROM badges
        `;
    const badges = await db.any(query);
    return badges;
  } catch (err) {
    throw new Error(err.message || err);
  }
};

module.exports = {
  addBadgeToTeam,
  getBadgesByTeamId,
  getBadgeById,
  getAllBadges,
};
