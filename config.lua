-- Configuration Loader with Defaults

local Config = {}

-- Default configuration values
Config.defaults = {
    url = "https://example.com",
    timeout = 30,
    retries = 3,
    features = {
        leaderboard = true,
        multiplayer = false,
        achievements = true
    }
}

-- Function to merge user settings with defaults
local function mergeDefaults(userConfig)
    local config = {}
    for k, v in pairs(Config.defaults) do
        config[k] = userConfig[k] or v
    end
    return config
end

-- Function to load configuration from a file or use defaults
function Config.load(userConfigFile)
    local userConfig = {}
    if userConfigFile then
        local file = io.open(userConfigFile, "r")
        if file then
            local content = file:read("*all")
            file:close()
            userConfig = load(content)()
        end
    end
    return mergeDefaults(userConfig)
end

return Config
