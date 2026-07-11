--[[]]
-- config.lua
-- This module contains the configuration settings for the game.

local config = {}

--- Game title.
-- @type string
config.title = "My Web3 Game"

--- Version of the game.
-- @type string
config.version = "1.0.0"

--- Maximum players allowed in the game.
-- @type number
config.maxPlayers = 100

--- Default game settings.
-- @type table
config.defaultSettings = {
    graphicsQuality = "high",
    soundEnabled = true,
    musicVolume = 0.5,
}

--- Network configuration.
-- @type table
config.network = {
    host = "https://api.example.com",
    port = 443,
}

--- Returns the game configuration table.
-- @return table
function config.getConfig()
    return config
end

return config
