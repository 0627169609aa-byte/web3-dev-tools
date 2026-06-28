-- Configuration Loader with Defaults

local json = require('dkjson') -- Use dkjson for JSON parsing

local Config = {}
Config.defaultConfig = {
    setting1 = "value1",
    setting2 = true,
    setting3 = 10,
    nested = {
        subSetting1 = "subValue1",
        subSetting2 = false
    }
}

function Config.loadConfig(filePath)
    local file, err = io.open(filePath, "r")
    if err then
        print("Error opening config file: " .. err)
        return Config.defaultConfig  -- Return defaults if file not found
    end

    local content = file:read("*a")
    file:close()

    local userConfig = json.decode(content)
    if not userConfig then
        print("Error parsing JSON, returning defaults")
        return Config.defaultConfig
    end

    -- Merge defaults with user config
    for key, value in pairs(Config.defaultConfig) do
        if userConfig[key] == nil then
            userConfig[key] = value
        elseif type(value) == "table" and type(userConfig[key]) == "table" then
            for subKey, subValue in pairs(value) do
                if userConfig[key][subKey] == nil then
                    userConfig[key][subKey] = subValue
                end
            end
        end
    end

    return userConfig
end

return Config