-- Configuration Loader for Web3 Gaming

local json = require('json')

local defaults = {
    network = 'mainnet',
    gameId = 'defaultGame',
    maxPlayers = 100,
    enableRewards = true,
    apiUrl = 'https://api.example.com'
}

local function loadConfig(filePath)
    local file = io.open(filePath, 'r')
    if not file then
        return defaults  -- return defaults if file not found
    end
    local content = file:read('*a')
    file:close()
    local configData = json.decode(content)
    if not configData then
        return defaults  -- return defaults if JSON is invalid
    end
    return setmetatable(configData, { __index = defaults })  -- combine defaults with loaded config
end

return {
    loadConfig = loadConfig
}