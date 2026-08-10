-- Helper functions for game interactions

local helpers = {}

-- Function to generate a unique ID for a game entity
function helpers.generateUniqueId()
    return tostring(math.random(1000000000, 9999999999))
end

-- Function to check if a value is a valid player ID
function helpers.isValidPlayerId(playerId)
    return type(playerId) == 'string' and #playerId > 0
end

-- Function to calculate the distance between two points
function helpers.calculateDistance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

-- Function to format time in seconds to a readable string
function helpers.formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local remainingSeconds = seconds % 60
    return string.format('%02d:%02d:%02d', hours, minutes, remainingSeconds)
end

return helpers
