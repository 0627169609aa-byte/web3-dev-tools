-- Utility functions for gaming data handling

local json = require('json')

local M = {}

-- Parse JSON data and return Lua table
function M.parseJSON(data)
    local success, result = pcall(json.decode, data)
    if not success then
        error('Failed to parse JSON: ' .. result)
    end
    return result
end

-- Convert Lua table to JSON string
function M.toJSON(table)
    local success, result = pcall(json.encode, table)
    if not success then
        error('Failed to convert table to JSON: ' .. result)
    end
    return result
end

-- Merge two tables
function M.mergeTables(t1, t2)
    local merged = {}
    for k, v in pairs(t1) do
        merged[k] = v
    end
    for k, v in pairs(t2) do
        merged[k] = v
    end
    return merged
end

-- Get player score from game data
function M.getPlayerScore(gameData, playerId)
    return gameData.players[playerId] and gameData.players[playerId].score or 0
end

-- Set player score in game data
function M.setPlayerScore(gameData, playerId, score)
    if not gameData.players[playerId] then
        gameData.players[playerId] = { score = 0 }
    end
    gameData.players[playerId].score = score
end

return M