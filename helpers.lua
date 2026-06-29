-- Utility function to calculate average
local function calculateAverage(values)
    local sum = 0
    for _, value in ipairs(values) do
        sum = sum + value
    end
    return sum / #values
end

-- Function to optimize player scoring
local function optimizeScores(players)
    local scores = {}
    for _, player in ipairs(players) do
        local totalScore = calculateAverage(player.scores)
        table.insert(scores, {name = player.name, optimizedScore = totalScore})
    end
    return scores
end

-- Function to sort players by optimized scores
local function sortPlayersByScore(players)
    table.sort(players, function(a, b) 
        return a.optimizedScore > b.optimizedScore
    end)
end

-- Main function to optimize and sort player's scores
local function optimizeAndSortPlayers(players)
    local optimizedPlayers = optimizeScores(players)
    sortPlayersByScore(optimizedPlayers)
    return optimizedPlayers
end

return {
    optimizeAndSortPlayers = optimizeAndSortPlayers
}