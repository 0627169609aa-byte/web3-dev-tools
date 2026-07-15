-- Core functionalities for web3 gaming

local Game = {}

--- Initializes a new game instance
-- @param name string: name of the game
-- @return table: new game instance
function Game:new(name)
    if type(name) ~= "string" or name == "" then
        error("Invalid game name.")
    end
    local newGame = { name = name, players = {} }
    setmetatable(newGame, self)
    self.__index = self
    return newGame
end

--- Adds a player to the game
-- @param player string: name of the player
-- @return boolean: true if added successfully, false otherwise
function Game:addPlayer(player)
    if type(player) ~= "string" or player == "" then
        error("Invalid player name.")
    end
    for _, existingPlayer in ipairs(self.players) do
        if existingPlayer == player then
            error("Player already exists.")
        end
    end
    table.insert(self.players, player)
    return true
end

--- Begins the game
-- @return string: Game start message
function Game:start()
    if #self.players < 2 then
        error("Not enough players to start the game.")
    end
    return "Game \"" .. self.name .. "\" has started with " .. #self.players .. " players!"
end

return Game
