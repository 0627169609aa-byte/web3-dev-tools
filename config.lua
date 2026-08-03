local config = {} 

-- Default configurations
config.default = {
    maxPlayers = 100,
    gameTimeout = 60,
    enableChat = true,
    skinOptions = {
        "default",
        "warrior",
        "mage",
        "archer"
    }
}

-- Function to load configuration
function config.load(configFile)
    local file, err = io.open(configFile, "r")
    if not file then
        return nil, "Error loading config: " .. err
    end
    local content = file:read("*a")
    file:close()
    local loadedConfig, loadErr = loadstring(content)
    if not loadedConfig then
        return nil, "Error parsing config: " .. loadErr
    end
    return loadedConfig()
end

-- Function to validate config
function config.validate(cfg)
    if type(cfg.maxPlayers) ~= "number" or cfg.maxPlayers <= 0 then
        return false, "Invalid maxPlayers"
    end
    if type(cfg.gameTimeout) ~= "number" or cfg.gameTimeout <= 0 then
        return false, "Invalid gameTimeout"
    end
    return true
end

return config