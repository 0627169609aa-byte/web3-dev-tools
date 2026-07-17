-- Configuration settings for the game

local Config = {}

--- Game settings with type annotations
-- @type Config
Config.settings = {
    volume = 1.0,  -- volume level (0.0 to 1.0)
    difficulty = 'normal',  -- game difficulty level
    resolution = {
        width = 1920,  -- screen width
        height = 1080  -- screen height
    },
    fullscreen = false,  -- fullscreen mode
}

--- Function to get a setting
-- @param key string: the setting key to retrieve
-- @return any: the value of the requested setting
function Config.getSetting(key)
    return Config.settings[key]
end

--- Function to set a setting
-- @param key string: the setting key to modify
-- @param value any: the new value to set
function Config.setSetting(key, value)
    if Config.settings[key] ~= nil then
        Config.settings[key] = value
    else
        error('Invalid setting key: ' .. key)
    end
end

return Config