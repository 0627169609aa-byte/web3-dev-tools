-- Utility functions for gaming data handling

local GameUtils = {}

--- Convert a table of player scores into a sorted list
-- @param scoresTable A table containing player names and their scores
-- @return A sorted list of player names based on their scores
function GameUtils.sortScores(scoresTable)
    local sortedScores = {}
    
    for playerName, score in pairs(scoresTable) do
        table.insert(sortedScores, {name = playerName, score = score})
    end
    
    table.sort(sortedScores, function(a, b) return a.score > b.score end)
    return sortedScores
end

--- Filter player data based on a minimum score
-- @param players A table containing player names and their scores
-- @param minScore The minimum score threshold for inclusion
-- @return A table of player names that meet the score criteria
function GameUtils.filterPlayersByScore(players, minScore)
    local filteredPlayers = {}
    
    for playerName, score in pairs(players) do
        if score >= minScore then
            filteredPlayers[playerName] = score
        end
    end
    
    return filteredPlayers
end

--- Calculate average score from a list of player scores
-- @param scoresTable A table containing player scores
-- @return The average score rounded to two decimal places
function GameUtils.calculateAverageScore(scoresTable)
    local totalScore = 0
    local playerCount = 0
    
    for _, score in pairs(scoresTable) do
        totalScore = totalScore + score
        playerCount = playerCount + 1
    end
    
    if playerCount == 0 then
        return 0
    end
    
    return math.floor((totalScore / playerCount) * 100) / 100
end

return GameUtils