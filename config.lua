-- Configuration loader with default values

local json = require('json')

local Config = {}

-- Default configuration values
Config.defaults = {
    serverAddress = 'localhost',
    serverPort = 8080,
    enableDebug = false,
    maxPlayers = 100,
}

-- Function to load configuration from a JSON file
function Config.load(filename)
    local file, err = io.open(filename, 'r')
    if err then
        print('Error opening config file: ' .. err)
        return Config.defaults
    end

    local content = file:read('*a')
    file:close()
    local configData = json.decode(content)

    -- Merging defaults with loaded configuration
    for key, value in pairs(Config.defaults) do
        if configData[key] == nil then
            configData[key] = value
        end
    end
    return configData
end

return Config
