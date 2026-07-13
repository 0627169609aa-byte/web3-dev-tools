-- Configuration loader with defaults

local json = require('json')

local defaultConfig = {
    width = 800,
    height = 600,
    fullscreen = false,
    volume = 0.5,
    resolution = 'high'
}

local function loadConfig(filePath)
    local file = io.open(filePath, 'r')
    if not file then
        return defaultConfig  -- Return defaults if config file doesn't exist
    end

    local content = file:read('*a')
    file:close()

    local userConfig = json.decode(content)
    for key, value in pairs(defaultConfig) do
        if userConfig[key] == nil then
            userConfig[key] = value  -- Set default if not provided
        end
    end

    return userConfig
end

return {
    loadConfig = loadConfig
}