-- Utility functions for handling gaming data

local utils = {}

--- Function to validate player data
-- @param playerData table: The player data to validate.
-- @return boolean: True if valid, false otherwise.
function utils.validatePlayerData(playerData)
    if type(playerData) ~= "table" then
        return false
    end
    local requiredFields = {"id", "name", "score"}
    for _, field in ipairs(requiredFields) do
        if playerData[field] == nil then
            return false
        end
    end
    return true
end

--- Function to calculate average score
-- @param players table: A table of player data.
-- @return number: The average score of players.
function utils.calculateAverageScore(players)
    local totalScore = 0
    local playerCount = #players
    
    for _, player in ipairs(players) do
        if player.score then
            totalScore = totalScore + player.score
        end
    end
    return playerCount > 0 and totalScore / playerCount or 0
end

--- Function to generate a unique player ID
-- @return string: A unique player ID.
function utils.generatePlayerID()
    local timestamp = os.time()
    local randomSuffix = math.random(1000, 9999)
    return string.format("player_%d_%d", timestamp, randomSuffix)
end

return utils
