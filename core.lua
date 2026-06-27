-- Core module to handle game state optimizations

local GameState = {}

-- Initialize game state
function GameState:new()
    local instance = {
        players = {},
        map = {},
        resources = {}
    }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

-- Update player position efficiently
function GameState:updatePlayerPosition(playerId, newPosition)
    if self.players[playerId] then
        self.players[playerId].position = newPosition
    else
        print("Player not found!")
    end
end

-- Add or update resource in map
function GameState:upsertResource(resourceId, resourceData)
    self.resources[resourceId] = resourceData
end

-- Optimize resource fetching by caching
function GameState:getResource(resourceId)
    return self.resources[resourceId] or nil
end

-- Batch update players' states
function GameState:batchUpdatePlayers(updates)
    for playerId, newPosition in pairs(updates) do
        self:updatePlayerPosition(playerId, newPosition)
    end
end

return GameState
