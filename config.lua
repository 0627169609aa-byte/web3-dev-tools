-- Default configurations
local defaultConfig = {
    network = "mainnet",
    gameName = "MyGame",
    maxPlayers = 100,
    enableChat = true,
    serverAddress = "https://api.mygame.com",
}

local ConfigLoader = {}

function ConfigLoader.load(userConfig)
    local config = {}
    -- Merge user configuration with defaults
    for key, value in pairs(defaultConfig) do
        config[key] = userConfig[key] or value
    end
    return config
end

return ConfigLoader