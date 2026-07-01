local json = require('json')

local defaultConfig = {
    database = {
        host = 'localhost',
        port = 5432,
        user = 'user',
        password = 'password',
        dbname = 'game_db'
    },
    server = {
        port = 8080,
        mode = 'development'
    },
    logging = {
        level = 'info',
        file = 'app.log'
    }
}

local function loadConfig(filePath)
    local configFile = io.open(filePath, 'r')
    if not configFile then
        return defaultConfig  -- Return defaults if config file not found
    end
    local content = configFile:read('*a')
    configFile:close()
    local userConfig = json.decode(content)

    -- Combine default config with user config
    local finalConfig = {}
    for k, v in pairs(defaultConfig) do
        finalConfig[k] = userConfig[k] or v
    end
    return finalConfig
end

return {
    loadConfig = loadConfig
}