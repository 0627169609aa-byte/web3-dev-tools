-- Configuration loader with defaults

local json = require('json')

local defaultConfig = {
    settingA = true,
    settingB = 42,
    settingC = 'default'
}

local function loadConfig(filename)
    local file, err = io.open(filename, 'r')
    if not file then
        print('Could not open config file:', err)
        return defaultConfig
    end

    local content = file:read('*a')
    file:close()

    local config, err = json.decode(content)
    if err then
        print('Error parsing config JSON:', err)
        return defaultConfig
    end

    -- Merge default config with loaded config
    for key, value in pairs(defaultConfig) do
        if config[key] == nil then
            config[key] = value
        end
    end

    return config
end

return {
    loadConfig = loadConfig
}