-- Performance Optimizations in Core Module

local function calculateGameScore(playerActions)
    local score = 0
    local scoreMultiplier = 1.5  -- Example multiplier for performance

    for _, action in ipairs(playerActions) do
        if action.type == "kill" then
            score = score + 100 * scoreMultiplier
        elseif action.type == "collect" then
            score = score + 50 * scoreMultiplier
        elseif action.type == "assist" then
            score = score + 75 * scoreMultiplier
        end
    end

    return score
end

local function updatePlayerStats(player, actions)
    local newScore = calculateGameScore(actions)
    player.score = player.score + newScore
    player.lastUpdated = os.time()
end

local function optimizeDataStorage(data)
    local compactedData = {}
    for key, value in pairs(data) do
        if value ~= nil then
            compactedData[key] = value
        end
    end
    return compactedData
end

return {
    calculateGameScore = calculateGameScore,
    updatePlayerStats = updatePlayerStats,
    optimizeDataStorage = optimizeDataStorage
}