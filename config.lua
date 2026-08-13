-- Configuration settings for the game

local config = {
    MAX_PLAYERS = 100,
    GAME_VERSION = "1.0.0",
    SERVER_ADDRESS = "127.0.0.1",
    PORT = 8080,
    DEBUG_MODE = true,
    RESOURCES = {
        images = "assets/images/",
        sounds = "assets/sounds/",
        scripts = "assets/scripts/"
    },
    playerDefaults = {
        health = 100,
        speed = 5,
        damage = 10
    },
}

-- Function to load configuration
function config.load()
    -- Normally you could load from a file or environment
    return config
end

return config
