-- Configuration Loader with Defaults

local Config = {}

-- Default Configuration
local defaultConfig = {
    apiUrl = "https://default.api.url",
    maxPlayers = 100,
    gameMode = "casual",
    debug = false
}

-- Load Configuration from file or use defaults
function Config.loadConfig(filePath)
    local file = io.open(filePath, "r")
    if not file then
        return defaultConfig  -- Return defaults if file not found
    end
    local content = file:read("*a")
    file:close()

    local config, err = load(content)
    if err then
        print("Error loading config: ", err)
        return defaultConfig  -- Return defaults if there's an error
    end

    setmetatable(config, {__index = defaultConfig})
    return config
end

return Config