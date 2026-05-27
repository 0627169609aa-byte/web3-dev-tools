-- Configuration Loader with Defaults

local Config = {}

-- Default configuration values
local defaultConfig = {
    host = "localhost",
    port = 8080,
    database = "my_database",
    debug = false,
    max_connections = 100
}

-- Function to load configuration from a file
function Config.loadConfig(filePath)
    local config = setmetatable({}, {__index = defaultConfig})

    local file = io.open(filePath, "r")
    if not file then
        print("Configuration file not found, using defaults.")
        return config
    end

    local content = file:read("*a")
    file:close()

    local loadedConfig = load(content)()
    for key, value in pairs(loadedConfig) do
        config[key] = value
    end

    return config
end

-- Function to get a configuration value
function Config.get(key)
    return defaultConfig[key]
end

return Config
