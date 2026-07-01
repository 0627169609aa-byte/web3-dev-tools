-- Core game logic for web3 gaming

local Game = {}

-- Initialize the game
function Game:new(name)
    local obj = { name = name, players = {}, state = 'waiting' }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

-- Add a player to the game
function Game:addPlayer(player)
    table.insert(self.players, player)
end

-- Start the game
function Game:start()
    if #self.players < 2 then
        error('Not enough players to start the game!')
    end
    self.state = 'active'
    print('Game started with '.. #self.players ..' players.')
end

-- End the game
function Game:endGame()
    self.state = 'finished'
    print('Game has ended. Thank you for playing!')
end

-- Get the current state of the game
function Game:getState()
    return self.state
end

return Game
