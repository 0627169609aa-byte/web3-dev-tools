-- Configuration settings for the game
-- Uses Lua tables for easy referencing

local config = {}

--- Gets the value from the configuration
-- @param key string: The key to retrieve from the config
-- @return mixed: The value associated with the key
function config.get(key)
    return config[key] or nil
end

--- Sets the value in the configuration
-- @param key string: The key to set in the config
-- @param value mixed: The value to assign to the key
function config.set(key, value)
    config[key] = value
end

--- Load default configuration settings
function config.loadDefaults()
    config['gameTitle'] = 'My Awesome Game'
    config['maxPlayers'] = 100
    config['defaultMap'] = 'StartingZone'
end

--- Initialize the configuration settings
function config.init()
    config.loadDefaults()
end

return config