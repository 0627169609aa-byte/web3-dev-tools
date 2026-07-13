-- Configuration loader with defaults

local json = require('json')

local Config = {}

-- Default configuration values
local defaultConfig = {
    server = 'localhost',
    port = 8080,
    environment = 'development',
    gameSettings = {
        maxPlayers = 100,
        gameMode = 'casual'
    }
}

-- Function to load configuration from a file
function Config.loadConfig(filePath)
    local configFile = io.open(filePath, 'r')
    if not configFile then
        print('No config file found, using defaults.')
        return defaultConfig
    end
    local content = configFile:read('*a')
    configFile:close()
    local customConfig = json.decode(content)
    return mergeConfigs(defaultConfig, customConfig)
end

-- Function to merge user configuration with defaults
local function mergeConfigs(defaults, userConfig)
    for key, value in pairs(userConfig) do
        if type(value) == 'table' and type(defaults[key]) == 'table' then
            defaults[key] = mergeConfigs(defaults[key], value)
        else
            defaults[key] = value
        end
    end
    return defaults
end

return Config
