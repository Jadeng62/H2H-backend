const db = require('../db/dbConfig');

const createTeam = async (teamInfo) => {
  const {
    team_name, team_pic, logo, captain_id, point_guard_id, power_forward_id,
    shooting_guard_id, small_forward_id, center_id
  } = teamInfo;

  try {
    const query = `
      INSERT INTO team (team_name, team_pic, logo, captain_id, point_guard_id, 
                        power_forward_id, shooting_guard_id, small_forward_id, center_id)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
      RETURNING *
    `;
    const newTeam = await db.one(query, [
      team_name, team_pic, logo, captain_id, point_guard_id, power_forward_id,
      shooting_guard_id, small_forward_id, center_id
    ]);

    return newTeam;
  } catch (error) {
    throw new Error(`Failed to create team with provided details: ${error.message}`);
  }
};

const updateTeam = async (teamInfo, team_id) => {
  const {
    team_name, team_pic, logo, point_guard_id, shooting_guard_id, small_forward_id,
    power_forward_id, center_id, captain_id, team_wins, team_loss, matches_played
  } = teamInfo;

  try {
    const query = `
      UPDATE team
      SET team_name=$1, team_pic=$2, logo=$3, point_guard_id=$4, shooting_guard_id=$5,
          small_forward_id=$6, power_forward_id=$7, center_id=$8, captain_id=$9,
          team_wins=$10, team_loss=$11, matches_played=$12
      WHERE id=$13
      RETURNING *
    `;
    const updatedTeam = await db.one(query, [
      team_name, team_pic, logo, point_guard_id, shooting_guard_id, small_forward_id,
      power_forward_id, center_id, captain_id, team_wins, team_loss, matches_played,
      Number(team_id)
    ]);

    return updatedTeam;
  } catch (error) {
    throw new Error(`Failed to update team with ID ${team_id}: ${error.message}`);
  }
};

const getAllTeams = async () => {
  try {
    const query = 'SELECT * FROM team;';
    const allTeams = await db.any(query);
    return allTeams;
  } catch (error) {
    throw new Error(`Failed to retrieve all teams: ${error.message}`);
  }
};

const getTeamByTeamId = async (id) => {
  try {
    const query = 'SELECT * FROM team WHERE id=$1';
    const oneTeam = await db.one(query, [id]);
    return oneTeam;
  } catch (error) {
    throw new Error(`Failed to retrieve team with ID ${id}: ${error.message}`);
  }
};

const getTeamByPlayerId = async (player_id) => {
  try {
    const query = `
      SELECT * FROM team
      WHERE point_guard_id = $1 OR shooting_guard_id = $1
         OR small_forward_id = $1 OR power_forward_id = $1
         OR center_id = $1
    `;
    const oneTeam = await db.one(query, [Number(player_id)]);
    return oneTeam;
  } catch (error) {
    throw new Error(`Failed to retrieve team for player ID ${player_id}: ${error.message}`);
  }
};

module.exports = {
  getAllTeams,
  createTeam,
  getTeamByTeamId,
  getTeamByPlayerId,
  updateTeam
};