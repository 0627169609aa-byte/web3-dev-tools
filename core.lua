-- Core logic for game management

local GameManager = {}

-- Initialize a new game state
function GameManager:new(gameId)
    local newObj = { id = gameId, players = {}, state = 'waiting' }
    self.__index = self
    return setmetatable(newObj, self)
end

-- Add a player to the game
function GameManager:addPlayer(playerId)
    if #self.players < 4 then  -- Limit to 4 players
        table.insert(self.players, playerId)
        return true
    else
        return false, 'Game is full'
    end
end

-- Start the game if enough players
function GameManager:startGame()
    if #self.players >= 2 then  -- Minimum players needed
        self.state = 'playing'
        return true
    else
        return false, 'Not enough players'
    end
end

-- End the game
function GameManager:endGame()
    self.state = 'ended'
    -- Additional cleanup can be done here
end

-- Get current game state
function GameManager:getState()
    return self.state
end

return GameManager