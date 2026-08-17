-- Configuration Loader with Defaults

local config = {}

-- Default configuration values
local defaultConfig = {
    host = "localhost",
    port = 8080,
    useSSL = false,
    logLevel = "info"
}

-- Function to load user configuration
local function loadConfig(userConfig)
    -- Start with default values
    for key, value in pairs(defaultConfig) do
        config[key] = userConfig[key] or value
    end
end

-- Function to get a configuration value
function config.get(key)
    return config[key] or nil
end

-- Function to print the current configuration
function config.print()
    for key, value in pairs(config) do
        print(string.format("%s: %s", key, tostring(value)))
    end
end

-- Load user configuration, if any
local userConfig = {}  -- Replace with actual user input logic
loadConfig(userConfig)

return config
