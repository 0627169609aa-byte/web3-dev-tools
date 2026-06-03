-- Core functionality for game interactions

local Game = {}

-- Initializes the game with default settings
function Game:new(name, maxPlayers)
    local newGame = {}
    setmetatable(newGame, self)
    self.__index = self
    newGame.name = name or "Untitled Game"
    newGame.maxPlayers = maxPlayers or 4
    newGame.players = {}
    return newGame
end

-- Adds a player to the game
function Game:addPlayer(player)
    if #self.players < self.maxPlayers then
        table.insert(self.players, player)
    else
        error("Cannot add more players than max limit.")
    end
end

-- Starts the game
function Game:start()
    if #self.players < 2 then
        error("Not enough players to start the game.")
    end
    print(self.name .. " has started with " .. #self.players .. " players.")
end

-- Provides game details
function Game:getDetails()
    return string.format("Game: %s, Players: %d/%d", self.name, #self.players, self.maxPlayers)
end

return Game
