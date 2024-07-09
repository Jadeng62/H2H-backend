const db = require('../db/dbConfig')

const getAllMatches = async (teamID) => {
  if(teamID){
    try {
      const allMatches = await db.any(
        'SELECT * FROM matches WHERE team1_id=$1 OR team2_id=$1',
        [teamID]
      )
  
      return allMatches
    } catch (error) {
      return error
    }
  } else{
    try {
      const allMatches = await db.any(
        'SELECT * FROM matches'
      )

      return allMatches
    } catch (error) {
      return error
    }
  }
}


module.exports = {
  getAllMatches
}
