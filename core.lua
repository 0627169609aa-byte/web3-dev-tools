-- Game state management module
local GameState = {}

-- Function to initialize the game state
function GameState:new()
    local instance = { score = 0, level = 1 }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

-- Function to update game score
function GameState:updateScore(points)
    if type(points) ~= 'number' then
        error('Invalid input: points must be a number')
    end
    self.score = self.score + points
end

-- Function to advance to the next level
function GameState:nextLevel()
    if self.level >= 10 then
        error('Maximum level reached')
    end
    self.level = self.level + 1
end

-- Function to get the current state
function GameState:getState()
    return { score = self.score, level = self.level }
end

return GameState
