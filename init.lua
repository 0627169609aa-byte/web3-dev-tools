--[[
    This module initializes the game settings and configurations.
    It allows for basic setup operations and resource loading to prepare the game environment.
]]

---

--- Initializes the game configuration
-- @return boolean success - whether the initialization was successful
function initGameConfig() 
    local config = {}  -- configuration table
    
    -- Set default values 
    config.screenWidth = 800 
    config.screenHeight = 600 
    config.fullscreen = false 
    config.title = 'Web3 Game'
    config.enableDebug = true
    
    -- Load resources (e.g. images, sounds)
    local success = loadResources(config)
    if not success then
        return false
    end
    
    -- Apply configuration settings
    applySettings(config)
    return true
end

--- Loads game resources
-- @param config table - the configuration table
-- @return boolean success - whether loading was successful
function loadResources(config) 
    -- Placeholder for resource loading logic
    print('Loading resources...')  
    return true  -- Simulate successful resource loading
end

--- Applies the configuration settings
-- @param config table - the configuration table
function applySettings(config)
    print('Applying settings:')
    print(' - Screen Size: ' .. config.screenWidth .. 'x' .. config.screenHeight)
    print(' - Fullscreen: ' .. tostring(config.fullscreen))
    print(' - Title: ' .. config.title)
    print(' - Debug Mode: ' .. tostring(config.enableDebug))
end

-- Run game configuration initialization
gameInitialized = initGameConfig()
if gameInitialized then
    print('Game initialized successfully!')
else
    print('Game failed to initialize.')
end
