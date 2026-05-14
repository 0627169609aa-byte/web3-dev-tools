-- Utility functions for gaming data handling

local M = {}

-- Function to calculate average score from a table of scores
-- @param scores: table   A table containing individual scores
-- @return: number       The average score
function M.calculate_average_score(scores)
    if #scores == 0 then
        return 0
    end
    local total = 0
    for _, score in ipairs(scores) do
        total = total + score
    end
    return total / #scores
end

-- Function to check if a player has reached a specific level
-- @param player_level: number   Current level of the player
-- @param target_level: number    Level to check against
-- @return: boolean              True if player reached or exceeded target level
function M.has_reached_level(player_level, target_level)
    return player_level >= target_level
end

-- Function to format player statistics as a string
-- @param player_name: string    Name of the player
-- @param score: number          Player's score
-- @param level: number          Player's current level
-- @return: string              Formatted string of player stats
function M.format_player_stats(player_name, score, level)
    return string.format("Player: %s | Score: %d | Level: %d", player_name, score, level)
end

return M
