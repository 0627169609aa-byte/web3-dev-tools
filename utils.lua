local json = require('json')

local ConfigLoader = {}

-- Default configuration settings
local defaultConfig = {
    gameName = 'My Game',
    maxPlayers = 4,
    adminEmail = 'admin@example.com',
    graphicsQuality = 'high',
    enableVoiceChat = false
}

-- Function to load configuration from a file
function ConfigLoader.loadConfig(filePath)
    local file = io.open(filePath, 'r')
    local config = {}
    if file then
        local content = file:read('*a')
        config = json.decode(content) or {}
        file:close()
    end
    -- Merge default settings with loaded config
    return setmetatable(config, { __index = defaultConfig })
end

return ConfigLoader
