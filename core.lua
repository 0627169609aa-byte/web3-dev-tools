-- Utility function to handle gaming data

local M = {}

-- Function to parse player stats from JSON input
-- @param jsonInput: string containing JSON player stats
-- @return table: parsed player stats
function M.parsePlayerStats(jsonInput)
    local json = require('cjson') -- Lua CJSON library for JSON handling
    local success, data = pcall(json.decode, jsonInput)
    
    if not success then
        error('Invalid JSON input: ' .. data)
    end
    
    return data
end

-- Function to calculate average score from player scores
-- @param scores: table containing player scores
-- @return number: average score
function M.calculateAverageScore(scores)
    local total = 0
    local count = #scores
    
    for _, score in ipairs(scores) do
        total = total + score
    end
    
    return total / count
end

-- Function to find the highest score
-- @param scores: table containing player scores
-- @return number: highest score
function M.findHighestScore(scores)
    local highest = scores[1]
    
    for _, score in ipairs(scores) do
        if score > highest then
            highest = score
        end
    end
    
    return highest
end

return M
