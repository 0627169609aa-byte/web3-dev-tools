-- Function to handle gaming data

local GameDataHandler = {}

-- Function to calculate average score from a list of scores
function GameDataHandler.calculateAverageScore(scores)
    if #scores == 0 then
        return 0
    end
    local total = 0
    for _, score in ipairs(scores) do
        total = total + score
    end
    return total / #scores
end

-- Function to get the highest score
function GameDataHandler.getHighestScore(scores)
    local highest = -math.huge
    for _, score in ipairs(scores) do
        if score > highest then
            highest = score
        end
    end
    return highest
end

-- Function to get the lowest score
function GameDataHandler.getLowestScore(scores)
    local lowest = math.huge
    for _, score in ipairs(scores) do
        if score < lowest then
            lowest = score
        end
    end
    return lowest
end

-- Function to format scores for display
function GameDataHandler.formatScores(scores)
    local formattedScores = {}
    for _, score in ipairs(scores) do
        table.insert(formattedScores, string.format("Score: %d", score))
    end
    return formattedScores
end

return GameDataHandler
