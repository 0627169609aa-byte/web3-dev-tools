-- Default configuration values
local defaultConfig = {
    environment = "development",
    logLevel = "info",
    maxPlayers = 100,
    serverTimeout = 30,
    gameName = "MyGame"
}

-- Function to load configuration from a file or use defaults
local function loadConfig(filePath)
    local config = defaultConfig -- Start with default values

    -- Attempt to read custom configuration file
    local file = io.open(filePath, "r")
    if file then
        local content = file:read("*a")  -- Read entire file content
        file:close()

        -- Decode JSON content
        local json = require("dkjson")
        local customConfig, pos, err = json.decode(content, 1, nil)

        if err then
            print("Error parsing JSON: " .. err)
        else
            -- Merge custom configuration with defaults
            for key, value in pairs(customConfig) do
                config[key] = value
            end
        end
    else
        print("Using default configuration since file not found: " .. filePath)
    end

    return config
end

-- Load configuration using a specified file path
local config = loadConfig("config.json")

-- Debug output of the loaded configuration
print("Loaded configuration:")
for k, v in pairs(config) do
    print(k .. ": " .. tostring(v))
end

return config
