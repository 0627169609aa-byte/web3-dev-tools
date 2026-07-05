-- Configuration loader with defaults

local json = require('dkjson')  -- Import JSON library

-- Default configuration
local defaultConfig = {
    gameName = 'My Awesome Game',
    maxPlayers = 100,
    difficulty = 'normal',
    serverHost = 'localhost',
    serverPort = 8080,
}

-- Function to load configuration from a file
local function loadConfig(filename)
    local file, err = io.open(filename, 'r')
    if not file then
        print('Could not open config file: ' .. err)
        return defaultConfig  -- Return defaults if file fails to load
    end
    
    local content = file:read('*a')
    file:close()
    
    local config, pos, err = json.decode(content, 1, nil)
    if err then
        print('Error parsing JSON config: ' .. err)
        return defaultConfig  -- Return defaults if JSON parsing fails
    end
    
    -- Merge defaults with loaded config
    for k, v in pairs(defaultConfig) do
        if config[k] == nil then
            config[k] = v  -- Assign default value
        end
    end
    
    return config
end

-- Load the configuration
local config = loadConfig('game_config.json')
return config
