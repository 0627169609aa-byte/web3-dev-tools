-- Initialize game settings
local function initializeGameSettings()
    return {
        maxPlayers = 10,
        gameDuration = 30,
        minLevel = 1,
        maxLevel = 100
    }
end

-- Validate input values
local function validateInput(input)
    if type(input.maxPlayers) ~= 'number' or input.maxPlayers < 1 or input.maxPlayers > 100 then
        return false, 'maxPlayers must be a number between 1 and 100'
    end
    if type(input.gameDuration) ~= 'number' or input.gameDuration <= 0 then
        return false, 'gameDuration must be a positive number'
    end
    if type(input.minLevel) ~= 'number' or input.minLevel < 1 or input.minLevel > 100 then
        return false, 'minLevel must be between 1 and 100'
    end
    if type(input.maxLevel) ~= 'number' or input.maxLevel < 1 or input.maxLevel > 100 then
        return false, 'maxLevel must be between 1 and 100'
    end
    return true, ''
end

-- Main processing loop
local function mainLoop()
    local gameSettings = initializeGameSettings()
    local isValid, errorMsg = validateInput(gameSettings)
    if not isValid then
        error(errorMsg)
    end
    -- Proceed with game logic using validated settings
    print('Game settings are valid. Starting the game...')
end

mainLoop()
