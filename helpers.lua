-- Configuration loader with default values

local json = require('dkjson') -- Ensure dkjson is available for JSON handling

local M = {}

-- Default configuration
local defaultConfig = {
    server = {
        host = 'localhost',
        port = 8080
    },
    database = {
        type = 'sqlite',
        name = 'game.db'
    },
    logging = {
        level = 'info'
    }
}

-- Function to deep merge two tables
local function mergeTables(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == 'table' and type(t1[k] or false) == 'table' then
            mergeTables(t1[k], v)
        else
            t1[k] = v
        end
    end
    return t1
end

-- Load configuration from a JSON file
function M.loadConfig(filePath)
    local file, err = io.open(filePath, 'r')
    if not file then
        return defaultConfig -- Load defaults if file can't be opened
    end
    local content = file:read('*a')
    file:close()
    local userConfig, pos, err = json.decode(content, 1, nil)
    if err then
        error('Error parsing JSON at position ' .. pos .. ': ' .. err)
    end
    return mergeTables(defaultConfig, userConfig)
end

return M
