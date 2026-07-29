-- Performance optimized core module for web3-dev-tools

local function fetchPlayerData(playerId)
    local cache = {}

    if cache[playerId] then
        return cache[playerId]
    end

    -- Simulating an async network call to fetch player data
    local playerData = simulateNetworkCall(playerId)  -- Assume this function exists
    cache[playerId] = playerData
    return playerData
end

local function calculateGameStatistics(playerId)
    local playerData = fetchPlayerData(playerId)
    local statistics = {
        score = playerData.score,
        level = playerData.level,
        experience = playerData.experience
    }
    return statistics
end

local function optimizedGameLoop(players)
    for _, playerId in ipairs(players) do
        local stats = calculateGameStatistics(playerId)
        print(string.format("Player: %s | Score: %d | Level: %d",
            playerId, stats.score, stats.level))
    end
end

return {
    fetchPlayerData = fetchPlayerData,
    calculateGameStatistics = calculateGameStatistics,
    optimizedGameLoop = optimizedGameLoop
}