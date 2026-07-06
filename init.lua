--[[
    init.lua
    This script initializes the game environment,
    setting up necessary configurations and error handling.
]]

-- Function to load configurations
local function loadConfig()
    local success, config = pcall(function()
        return require('config')
    end)
    if not success then
        error('Failed to load configuration: ' .. config)
    end
    return config
end

-- Function to initialize the game
local function initializeGame()
    local config = loadConfig()
    -- Initialize game attributes
    local gameData = { players = {}, state = 'initializing' }
    return gameData
end

-- Function to handle game start
local function startGame()
    local success, gameData = pcall(initializeGame)
    if not success then
        print('Error starting game: ' .. gameData)
        return nil
    end
    return gameData
end

--[=[
    Main entry point of the module.
    Starts the game and handles any potential errors.
]=]--
local function main()
    local success, game = pcall(startGame)
    if not success then
        print('Unexpected error: ' .. game)
    else
        print('Game started successfully!')
    end
end

-- Execute the main function
main()
