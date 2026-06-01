-- Configuration settings for web3-dev-tools
local config = {}

-- Network settings
config.network = {
    host = 'localhost',
    port = 8545,
    protocol = 'http',
}

-- Game settings
config.game = {
    maxPlayers = 4,
    gameWorld = 'default',
}

-- Input validation function
local function validateInput(input)
    if type(input) ~= 'table' then
        return false, 'Input must be a table'
    end
    if not input.playerName or type(input.playerName) ~= 'string' then
        return false, 'playerName is required and must be a string'
    end
    if not input.playerId or type(input.playerId) ~= 'string' then
        return false, 'playerId is required and must be a string'
    end
    return true, ''
end

-- Main processing loop
function config.processInput(input)
    local isValid, errorMsg = validateInput(input)
    if not isValid then
        error(errorMsg)
    end
    -- Process the input if valid
    print('Processing input for player:', input.playerName)
    -- Additional processing logic would go here
end

return config