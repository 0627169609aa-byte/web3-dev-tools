-- Configuration settings for the game
local Config = {}

-- Game settings
Config.gameName = "SuperGame"
Config.fullscreen = true

-- Performance settings
Config.maxFPS = 60
Config.enableVSync = true
Config.textureQuality = "high"
Config.audioVolume = 0.8

-- Network settings
Config.serverAddress = "127.0.0.1"
Config.serverPort = 8080

-- Function to load configuration 
function Config.load() 
    -- Load settings from a file or default values 
    -- This is a placeholder for actual file loading logic
end

return Config
