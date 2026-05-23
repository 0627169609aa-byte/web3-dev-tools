-- Configuration loader with defaults

local Config = {}

-- Default configuration
local defaultConfig = {
    database = {
        host = 'localhost',
        port = 5432,
        user = 'admin',
        password = 'password',
        db_name = 'game_db'
    },
    gameplay = {
        difficulty = 'normal',
        max_players = 4,
        min_players = 1
    },
    graphics = {
        resolution = '1920x1080',
        fullscreen = true
    }
}

-- Load user configuration from file
local function loadConfig(filePath)
    local file = io.open(filePath, 'r')
    if not file then
        return defaultConfig -- Return defaults if file doesn't exist
    end
    local content = file:read('*a')
    file:close()
    local userConfig = assert(load('return ' .. content))()
    return mergeConfigs(defaultConfig, userConfig)
end

-- Merge user configuration with defaults
local function mergeConfigs(defaults, user)
    for k, v in pairs(user) do
        if type(v) == 'table' and type(defaults[k]) == 'table' then
            mergeConfigs(defaults[k], v)
        else
            defaults[k] = v
        end
    end
    return defaults
end

-- Expose the loadConfig function
function Config.load(filePath)
    return loadConfig(filePath)
end

return Config
