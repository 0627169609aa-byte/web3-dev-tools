-- Configuration Loader with Defaults

local json = require('json')

local Config = {}

-- Default configuration values
Config.defaults = {
    database = {
        host = 'localhost',
        port = 3306,
        user = 'root',
        password = '',
        name = 'game_db'
    },
    server = {
        host = '0.0.0.0',
        port = 8080
    },
    logging = {
        level = 'info',
        file = 'app.log'
    }
}

-- Load configuration from a JSON file
function Config.load(file_path)
    local file = io.open(file_path, 'r')
    if not file then
        print('Configuration file not found, loading defaults.')
        return Config.defaults
    end
    local content = file:read('*a')
    file:close()

    local user_config = json.decode(content)
    return Config.merge(Config.defaults, user_config)
end

-- Merge default values with user-defined values
function Config.merge(defaults, user_defined)
    for key, value in pairs(user_defined) do
        if type(value) == 'table' and type(defaults[key]) == 'table' then
            defaults[key] = Config.merge(defaults[key], value)
        else
            defaults[key] = value
        end
    end
    return defaults
end

return Config
