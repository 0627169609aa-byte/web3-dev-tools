-- Function to handle gaming data

local GameDataHandler = {}

-- Function to normalize player scores
function GameDataHandler.normalizeScores(playerScores)
    local totalScore = 0
    local numPlayers = #playerScores

    for _, score in ipairs(playerScores) do
        totalScore = totalScore + score
    end

    local averageScore = totalScore / numPlayers

    local normalizedScores = {}
    for i, score in ipairs(playerScores) do
        normalizedScores[i] = score / averageScore
    end

    return normalizedScores
end

-- Function to filter out low scores
function GameDataHandler.filterLowScores(playerScores, threshold)
    local filteredScores = {}
    for _, score in ipairs(playerScores) do
        if score >= threshold then
            table.insert(filteredScores, score)
        end
    end
    return filteredScores
end

-- Function to get the top scoring player
function GameDataHandler.getTopPlayer(playerScores)
    local topScore = -1
    local topPlayerIndex = -1

    for i, score in ipairs(playerScores) do
        if score > topScore then
            topScore = score
            topPlayerIndex = i
        end
    end

    return topPlayerIndex, topScore
end

return GameDataHandler