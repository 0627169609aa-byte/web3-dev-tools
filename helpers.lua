-- Utility functions for gaming data handling

local M = {}

-- Function to convert a table of player data into a JSON string
local function tableToJson(data)
    local json = require('json')
    return json.encode(data)
end

-- Function to calculate average score from player scores
function M.calculateAverageScore(scores)
    local total = 0
    local count = #scores

    for _, score in ipairs(scores) do
        total = total + score
    end

    return count > 0 and total / count or 0
end

-- Function to get player rankings based on scores
function M.getPlayerRankings(players)
    table.sort(players, function(a, b)
        return a.score > b.score
    end)
    return players
end

-- Function to get a player's total play time
function M.calculateTotalPlayTime(playTimes)
    local total = 0

    for _, time in ipairs(playTimes) do
        total = total + time
    end

    return total
end

-- Function to format gaming data for saving
function M.formatGamingData(players)
    local formattedData = {}
    for _, player in ipairs(players) do
        table.insert(formattedData, {
            name = player.name,
            score = player.score,
            playTime = player.playTime
        })
    end
    return tableToJson(formattedData)
end

return M
