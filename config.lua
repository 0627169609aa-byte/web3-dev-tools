-- Configuration loader with defaults

local Config = {}

-- Default configuration
local defaultConfig = {
    gameTitle = 'Untitled Game',
    maxPlayers = 4,
    gameMode = 'sandbox',
    difficulty = 'normal',
    serverPort = 8080,
    databaseHost = 'localhost',
    databasePort = 3306,
    enableLogging = true
}

-- Function to load configuration from a file
function Config.load(filePath)
    local configFile = io.open(filePath, 'r')
    if not configFile then
        return defaultConfig -- Return defaults if file not found
    end
    local configContent = configFile:read('*all')
    configFile:close()
    local config = load('return ' .. configContent)
    setmetatable(config, {__index = defaultConfig}) -- Use defaults for missing values
    return config
end

-- Function to save configuration to a file
function Config.save(filePath, config)
    local configFile = io.open(filePath, 'w')
    if not configFile then
        error('Could not open config file for writing: ' .. filePath)
    end
    local configString = 'return ' .. table.tostring(config)
    configFile:write(configString)
    configFile:close()
end

return Config
