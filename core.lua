-- Utility functions for gaming data handling

-- Function to calculate the player's score based on various factors
-- @param baseScore Number representing the base score of the player
-- @param levelBonus Number representing the bonus score for the level
-- @param multiplier Number representing any multipliers applied
-- @return Number representing the total score
function calculateScore(baseScore, levelBonus, multiplier)
    local totalScore = (baseScore + levelBonus) * multiplier
    return totalScore
end

-- Function to format player stats into a readable string
-- @param playerName String representing the name of the player
-- @param playerLevel Number representing the level of the player
-- @param playerScore Number representing the score of the player
-- @return String formatted player stats
function formatPlayerStats(playerName, playerLevel, playerScore)
    return string.format("Player: %s | Level: %d | Score: %d", playerName, playerLevel, playerScore)
end

-- Function to validate gaming data before processing
-- @param data Table containing gaming data to validate
-- @return Boolean indicating if the data is valid
function validateGamingData(data)
    if not data.playerName or type(data.playerName) ~= "string" then
        return false
    end
    if not data.playerLevel or type(data.playerLevel) ~= "number" then
        return false
    end
    if not data.playerScore or type(data.playerScore) ~= "number" then
        return false
    end
    return true
end

-- Example use case of the utility functions
local examplePlayerData = {
    playerName = "Hero",
    playerLevel = 5,
    playerScore = 200
}

if validateGamingData(examplePlayerData) then
    local score = calculateScore(examplePlayerData.playerScore, 50, 2)
    print(formatPlayerStats(examplePlayerData.playerName, examplePlayerData.playerLevel, score))
else
    print("Invalid player data.")
end
