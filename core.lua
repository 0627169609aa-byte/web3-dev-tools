-- Utility function to handle gaming data

local GameDataUtils = {}

-- Function to calculate total score from a list of scores
-- @param scores: a table containing individual scores
-- @return total score as a number
function GameDataUtils.calculateTotalScore(scores)
    local total = 0
    for _, score in ipairs(scores) do
        total = total + score
    end
    return total
end

-- Function to find the highest score
-- @param scores: a table containing individual scores
-- @return highest score as a number
function GameDataUtils.findHighestScore(scores)
    local highest = scores[1] or 0
    for _, score in ipairs(scores) do
        if score > highest then
            highest = score
        end
    end
    return highest
end

-- Function to average scores
-- @param scores: a table containing individual scores
-- @return average score as a number
function GameDataUtils.calculateAverageScore(scores)
    local total = GameDataUtils.calculateTotalScore(scores)
    return total / #scores
end

return GameDataUtils