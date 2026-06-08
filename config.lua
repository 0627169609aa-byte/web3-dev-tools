-- Configuration Loader Module

local json = require('dkjson')

local Config = {}

-- Default configuration values
local defaults = {
    server = {
        host = 'localhost',
        port = 8080
    },
    database = {
        user = 'root',
        password = '',
        name = 'mydb'
    },
    logging = {
        level = 'info'
    }
}

-- Function to load configuration from a file
function Config.loadConfig(filename)
    local file = io.open(filename, 'r')
    if not file then
        print('No configuration file found, using defaults.')
        return defaults
    end

    local content = file:read('*all')
    file:close()

    local config, pos, err = json.decode(content, 1, nil)
    if err then
        print('Error parsing configuration: ' .. err)
        return defaults
    end

    return setmetatable(config or {}, {__index = defaults})
end

-- Export the Config module
return Config
