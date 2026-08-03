-- Configuration Loader for Web3 Gaming

local json = require('json')

local ConfigLoader = {}
ConfigLoader.defaults = {
    network = 'mainnet',
    gasPrice = 1000000000,
    timeout = 30000,
    logging = true,
}

function ConfigLoader.loadConfig(filePath)
    local file, err = io.open(filePath, 'r')
    if err then
        print('Error opening config file: ' .. err)
        return ConfigLoader.defaults
    end

    local content = file:read('*a')
    file:close()

    local userConfig = json.decode(content)
    if userConfig == nil then
        print('Invalid JSON format, using defaults.')
        return ConfigLoader.defaults
    end

    -- Merge user config with defaults
    for key, value in pairs(ConfigLoader.defaults) do
        if userConfig[key] == nil then
            userConfig[key] = value
        end
    end

    return userConfig
end

return ConfigLoader