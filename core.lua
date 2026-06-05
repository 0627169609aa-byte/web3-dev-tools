-- Helper function to calculate the player's score
local function calculateScore(actions)
    local totalScore = 0
    for _, action in ipairs(actions) do
        if action.type == "win" then
            totalScore = totalScore + 10
        elseif action.type == "lose" then
            totalScore = totalScore - 5
        elseif action.type == "draw" then
            totalScore = totalScore + 1
        end
    end
    return totalScore
end

-- Helper function to format player's display name
local function formatDisplayName(playerName)
    return playerName:upper() .. "_GAMER"
end

-- Helper function to check if a player is banned
local function isPlayerBanned(playerId, bannedList)
    for _, bannedId in ipairs(bannedList) do
        if playerId == bannedId then
            return true
        end
    end
    return false
end

-- Exporting functions for external use
return {
    calculateScore = calculateScore,
    formatDisplayName = formatDisplayName,
    isPlayerBanned = isPlayerBanned
}