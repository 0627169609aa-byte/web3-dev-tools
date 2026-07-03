-- Utility function to handle gaming data

local utils = {}

-- Function to calculate the average score from a table of scores
-- @param scores Table of numeric scores
-- @return Number representing the average score
function utils.calculateAverageScore(scores)
    if #scores == 0 then
        return 0
    end
    local total = 0
    for _, score in ipairs(scores) do
        total = total + score
    end
    return total / #scores
end

-- Function to format player statistics
-- @param playerTable Table containing player stats
-- @return Formatted string of player stats
function utils.formatPlayerStats(playerTable)
    local stats = ""
    for key, value in pairs(playerTable) do
        stats = stats .. string.format("%s: %s\n", key, value)
    end
    return stats
end

-- Function to determine if a player meets a score threshold
-- @param playerScore Player's current score
-- @param threshold Minimum score required
-- @return Boolean indicating if the player meets the threshold
function utils.isScoreAboveThreshold(playerScore, threshold)
    return playerScore > threshold
end

return utils