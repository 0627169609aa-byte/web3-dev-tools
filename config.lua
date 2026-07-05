-- Configuration loader with default values
local ConfigLoader = {}

-- Default configuration settings
local defaultConfig = {
    host = 'localhost',
    port = 8080,
    maxPlayers = 100,
    gameTitle = 'My Awesome Game',
}

-- Function to merge user-provided configurations with defaults
local function mergeConfig(userConfig)
    local config = {}
    for k, v in pairs(defaultConfig) do
        config[k] = userConfig[k] or v
    end
    return config
end

-- Function to load the configuration from a file
function ConfigLoader.loadConfig(filePath)
    local userConfig = {}
    local file = io.open(filePath, 'r')
    if file then
        local content = file:read('*all')
        userConfig = loadstring(content)()
        file:close()
    end
    return mergeConfig(userConfig)
end

return ConfigLoader