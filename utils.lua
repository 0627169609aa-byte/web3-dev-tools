-- Utility functions for gaming data handling

local M = {}

-- Function to calculate player score based on actions
-- @param baseScore: The initial score
-- @param actions: A table of actions performed by the player
-- @return: Calculated total score
function M.calculateScore(baseScore, actions)
    local totalScore = baseScore
    
    for _, action in ipairs(actions) do
        if action.type == 'kill' then
            totalScore = totalScore + (action.value or 1) * 10  -- Each kill gives 10 points
        elseif action.type == 'collect' then
            totalScore = totalScore + (action.value or 1) * 5   -- Each item collected gives 5 points
        elseif action.type == 'completeQuest' then
            totalScore = totalScore + (action.value or 1) * 20  -- Completing a quest gives 20 points
        end
    end
    
    return totalScore
end

-- Function to normalize player statistics
-- @param stats: A table of player statistics
-- @return: Normalized statistics table
function M.normalizeStats(stats)
    local total = 0
    local normalized = {}

    for _, stat in pairs(stats) do
        total = total + stat
    end

    for key, stat in pairs(stats) do
        normalized[key] = stat / total  -- Normalize each stat based on total
    end

    return normalized
end

return M
