-- Configuration settings for the game

local Config = {}

-- Game settings
Config.gameName = "Web3 Adventure"
Config.maxPlayers = 100
Config.defaultPlayerHealth = 100
Config.playerSpeed = 5
Config.gravity = 9.81

-- Network settings
Config.network = {}
Config.network.protocol = "https"
Config.network.host = "api.web3-adventure.com"
Config.network.port = 443
Config.network.timeout = 30 -- seconds

-- Logging settings
Config.logging = {}
Config.logging.level = "info"
Config.logging.output = "console"

return Config
