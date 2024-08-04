// This file handles business logic for badge evaluation

// import queries we need to update db
const { getTeamByTeamId, getAllTeams } = require("../queries/team.js");
const { getAllMatchesByTeamID } = require("../queries/matches.js");
const { getBadgeById, addBadgeToTeam } = require("../queries/badges.js");

// Evaluation functions for different badge criteria
const evaluateTeamCreationBadge = (team) => {
  return team.created_at !== null;
};

const evaluateFullRosterBadge = (team) => {
  return (
    team.point_guard_id &&
    team.shooting_guard_id &&
    team.small_forward_id &&
    team.power_forward_id &&
    team.center_id
  );
};

const evaluateThreeConsecutiveWinsBadge = async (teamId, matches) => {
  const wins = matches
    .filter((match) => match.team1_id === team_Id || match.team2_id === teamId)
    .sort((a, b) => new Date(b.start_datetime) - new Date(a.start_datetime));

  let consecutiveWins = 0;
  let lastCourt = null;

  for (const match of wins) {
    if (match.match_winner === teamId && match.park_name === lastCourt) {
      consecutiveWins++;
    } else {
      consecutiveWins = match.match_winner === teamId ? 1 : 0;
    }
    lastCourt = match.park_name;

    if (consecutiveWins >= 3) {
      return true;
    }
  }
  return false;
};

const evaluateLosingStreakBadge = async (teamId, matches) => {
  const losses = matches
    .filter(
      (match) =>
        (match.team1_id === teamId || match.team2_id === teamId) &&
        match.match_loser === teamId
    )
    .sort((a, b) => new Date(b.start_datetime) - new Date(a.start_datetime));

  let losingStreak = 0;

  for (const loss of losses) {
    if (losingStreak < 5) {
      losingStreak++;
    } else {
      return true;
    }
  }
  return false;
};

const evaluateCloseWinBadge = (match) => {
  const margin =
    match.team1_id === match.match_winner
      ? match.team1_score - match.team2_score
      : match.team2_score - match.team1_score;
  return margin <= 3;
};

const evaluateSleepingBeautyBadge = (team, lastMatchDate) => {
  const oneWeekAgo = new Date();
  oneWeekAgo.setDate(oneWeekAgo.getDate() - 7);
  return new Date(lastMatchDate) < oneWeekAgo;
};

const evaluateViciousCycleBadge = (team) => {
  return team.team_wins === team.team_loss;
};

const evaluateTheCrownBadge = (teams) => {
  const maxWins = Math.max(...teams.map((team) => team.team_wins));
  return teams.filter((team) => team.team_wins === maxWins);
};

const evaluateHighScorerBadge = (teams) => {
  const highestAverage = Math.max(
    ...teams.map((team) => team.average_points_per_game)
  );
  return teams.filter(
    (team) => team.average_points_per_game === highestAverage
  );
};

// badge evaluator
const evaluateBadgeCriteria = async (badgeId, teamId) => {
  const badge = await getBadgeById(badgeId);
  const team = await getTeamByTeamId(teamId);
  const matches = await getAllMatchesByTeamID(teamId);

  switch (badge.criteria.type) {
    case "team_creation":
      return evaluateTeamCreationBadge(team);

    case "full_roster":
      return evaluateFullRosterBadge(team);

    case "consecutive_wins":
      return evaluateThreeConsecutiveWinsBadge(teamId, matches);

    case "losing_streak":
      return evaluateLosingStreakBadge(teamId, matches);

    case "close_win":
      return matches.some((match) => evaluateCloseWinBadge(match));

    case "sleeping_beauty":
      const lastMatchDate = Math.max(
        ...matches.map((match) => new Date(match.start_datetime))
      );
      return evaluateSleepingBeautyBadge(team, lastMatchDate);

    case "vicious_cycle":
      return evaluateViciousCycleBadge(team);

    case "crown":
      const teams = await getAllTeams();
      return evaluateTheCrownBadge(teams).includes(team);

    case "high_scorer":
      const allTeams = await getAllTeams();
      return evaluateHighScorerBadge(allTeams).includes(team);

    default:
      return false;
  }
};

// Add badge to a team if criteria is fulfilled
const checkAndAddBadgeToTeam = async (teamId, badgeId) => {
  const isEligible = await evaluateBadgeCriteria(badgeId, teamId);
  if (isEligible) {
    return await addBadgeToTeam(teamId, badgeId);
  }
  return null;
};

module.exports = { checkAndAddBadgeToTeam };
