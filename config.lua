-- Configuration settings for the game

--- @class GameConfig
--- This class holds the configuration settings for the game.
--- @field playerName string: The name of the player.
--- @field maxPlayers integer: The maximum number of players allowed.
--- @field gameMode string: The current mode of the game.
--- @field difficulty string: The difficulty setting for the game.
local GameConfig = {}

--- Initialize the GameConfig with default values.
--- @return GameConfig instance
function GameConfig.new()
    local self = setmetatable({}, { __index = GameConfig })
    self.playerName = "Player1"
    self.maxPlayers = 4
    self.gameMode = "adventure"
    self.difficulty = "normal"
    return self
end

--- Set the player name.
--- @param name string: The name of the player.
function GameConfig:setPlayerName(name)
    self.playerName = name
end

--- Get the player name.
--- @return string: The name of the player.
function GameConfig:getPlayerName()
    return self.playerName
end

--- Set the maximum number of players.
--- @param max integer: The maximum number of players.
function GameConfig:setMaxPlayers(max)
    self.maxPlayers = max
end

--- Get the maximum number of players.
--- @return integer: The maximum number of players.
function GameConfig:getMaxPlayers()
    return self.maxPlayers
end

return GameConfig
