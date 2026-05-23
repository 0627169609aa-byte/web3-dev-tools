-- Configuration Loader with Defaults

local json = require('json') -- JSON library for decoding

local Config = {}

-- Default configuration values
Config.defaults = {
    host = 'localhost',
    port = 8080,
    timeout = 30,
    use_ssl = false
}

-- Function to load configuration from a file
function Config.load(configFile)
    local file, err = io.open(configFile, 'r')
    if err then
        print('Error loading config file: ' .. err)
        return Config.defaults -- return defaults on error
    end

    local content = file:read('*a')
    file:close()
    local configFromFile = json.decode(content)

    -- Merge file config with defaults
    for key, value in pairs(Config.defaults) do
        configFromFile[key] = configFromFile[key] or value
    end

    return configFromFile
end

return Config