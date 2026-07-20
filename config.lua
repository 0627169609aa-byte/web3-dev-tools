-- Configuration loader with defaults

local json = require('json')
local defaultConfig = {
    gameName = 'My Awesome Game',
    maxPlayers = 100,
    serverRegion = 'us-east',
    enableVoiceChat = false,
    graphicsQuality = 'high'
}

local function loadConfig(filePath)
    local file, err = io.open(filePath, 'r')
    if not file then
        print('Warning: Could not open config file, loading defaults. Error: ' .. err)
        return defaultConfig
    end

    local content = file:read('*a')
    file:close()

    local userConfig, decodeErr = json.decode(content)
    if decodeErr then
        print('Warning: Error decoding JSON, loading defaults. Error: ' .. decodeErr)
        return defaultConfig
    end

    return setmetatable(userConfig, {__index = defaultConfig})
end

return {
    loadConfig = loadConfig
}