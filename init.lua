-- Initializes the game Web3 environment
local function initializeGame(config)
    -- Validate the config table
    if type(config) ~= 'table' then
        error('Invalid configuration: expected a table')
    end

    -- Ensure required fields are present
    local requiredFields = {'apiKey', 'network', 'gameId'}
    for _, field in ipairs(requiredFields) do
        if not config[field] then
            error('Missing required field: ' .. field)
        end
    end

    print('Initializing game with ID: ' .. config.gameId)

    -- Simulate network connection to Web3
    local success, err = pcall(function()
        connectToNetwork(config.network)
    end)

    if not success then
        error('Network connection failed: ' .. err)
    end

    print('Successfully connected to network: ' .. config.network)

    -- More initialization code can go here
end

-- Simulated function to illustrate network connectionunction connectToNetwork(network)
    if network ~= 'mainnet' and network ~= 'testnet' then
        error('Unsupported network: ' .. network)
    end
    -- Simulate connection logic
    return true
end

-- Example config object
local gameConfig = {
    apiKey = 'your_api_key',
    network = 'mainnet',
    gameId = 'game_1234'
}

-- Run the initialization
xpcall(function() initializeGame(gameConfig) end, function(err)
    print('Initialization error: ' .. err)
end)