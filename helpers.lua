-- Utility functions for gaming data handling

local M = {}

-- Convert game data to JSON format
function M.toJson(data)
    local json = require('cjson')  -- Assume 'cjson' library is available for JSON handling
    return json.encode(data)
end

-- Convert JSON string back to Lua table
function M.fromJson(jsonString)
    local json = require('cjson')
    return json.decode(jsonString)
end

-- Validate player data structure
function M.validatePlayerData(playerData)
    -- Check required fields exist
    local requiredFields = {'id', 'name', 'score', 'level'}
    for _, field in ipairs(requiredFields) do
        if not playerData[field] then
            return false, field .. ' is missing'
        end
    end
    return true
end

-- Calculate average score of players
function M.calculateAverageScore(players)
    local totalScore = 0
    local playerCount = 0

    for _, player in ipairs(players) do
        if player.score then
            totalScore = totalScore + player.score
            playerCount = playerCount + 1
        end
    end

    if playerCount == 0 then
        return 0  -- Avoid division by zero
    end
    return totalScore / playerCount
end

return M
