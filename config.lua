-- Configuration Loader with Defaults

local json = require('json')

local defaultConfig = {
    gameName = 'Web3 Game',
    maxPlayers = 100,
    enableRewards = true,
    serverRegion = 'us-east',
    databaseUrl = 'mongodb://localhost:27017/game'
}

local function loadConfig(filePath)
    local file, err = io.open(filePath, 'r')
    if err then
        print('Error opening config file: ' .. err)
        return defaultConfig  -- Return defaults if file not found or error
    end

    local content = file:read('*a')
    file:close()

    local userConfig
    local success, err = pcall(function()
        userConfig = json.decode(content)
    end)

    if not success then
        print('Error parsing config file: ' .. err)
        return defaultConfig  -- Return defaults on parse error
    end

    return setmetatable(userConfig or {}, {__index = defaultConfig})
end

return { loadConfig = loadConfig }