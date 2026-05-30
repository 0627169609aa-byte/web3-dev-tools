-- Configuration loader with defaults

local Config = {}

-- Default configurations
local defaultConfig = {
    server = "localhost",
    port = 8080,
    maxPlayers = 100,
    gameName = "MyAwesomeGame",
    enableLogging = true
}

-- Function to load configuration
function Config.loadConfig(userConfig)
    local finalConfig = {}
    -- Merge user configuration with defaults
    for key, value in pairs(defaultConfig) do
        finalConfig[key] = userConfig[key] or value
    end
    return finalConfig
end

-- Function to display current config
function Config.displayConfig(config)
    for key, value in pairs(config) do
        print(key .. ": " .. tostring(value))
    end
end

return Config