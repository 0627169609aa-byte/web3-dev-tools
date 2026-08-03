-- Utility functions for gaming data handling

local M = {}

--- Convert a table of player stats into a JSON string
-- @param stats Table containing player statistics
-- @return JSON string representation of player stats
function M.statsToJSON(stats)
    local json = require('dkjson')
    return json.encode(stats)
end

--- Calculate the average score from a list of scores
-- @param scores Table containing numerical scores
-- @return Average score as a number
function M.calculateAverageScore(scores)
    local total = 0
    local count = #scores 
    for _, score in ipairs(scores) do
        total = total + score
    end
    return count > 0 and total / count or 0
end

--- Find the highest score in a list of scores
-- @param scores Table containing numerical scores
-- @return The highest score as a number
function M.findHighestScore(scores)
    local highest = -math.huge 
    for _, score in ipairs(scores) do
        if score > highest then
            highest = score
        end
    end
    return highest
end

return M