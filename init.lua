--[[
    init.lua
    This module initializes the web3 gaming environment, setting up necessary configurations,
    including loading required libraries and setting global variables for the gaming application.
]]

-- Type annotations for the init module

-- Global variables
local web3 = require('web3')  -- web3 library for blockchain interaction
local playerList = {}  -- List to keep track of players

--- 
-- Initializes the gaming environment with essential configurations.
-- @param config table: Configuration table with necessary parameters.
-- @return boolean: Returns true if initialization is successful, false otherwise.
local function initGameEnvironment(config)
    if not config or type(config) ~= 'table' then
        print('Invalid configuration provided. Initialization failed.')
        return false
    end
    
    -- Set up global parameters
    gameTitle = config.title or 'Web3 Game'
    maxPlayers = config.maxPlayers or 100

    print('Initializing the game: ' .. gameTitle)
    print('Maximum players allowed: ' .. maxPlayers)

    -- Placeholder for further initialization logic
    -- For example: Loading assets, connecting to a blockchain, etc.

    return true  -- Initialization was successful
end

--- 
-- Adds a player to the game.
-- @param player table: The player object to add.
-- @return boolean: Returns true if player is added, false if not.
local function addPlayer(player)
    if #playerList >= maxPlayers then
        print('Player limit reached. Cannot add more players.')
        return false
    end
    
    table.insert(playerList, player)
    print('Player added: ' .. player.name)
    return true
end

-- Initialize the game with default settings
local success = initGameEnvironment({ title = 'Crypto Battle Arena', maxPlayers = 50 })

-- Example of adding players
if success then
    addPlayer({ name = 'Player1' })
    addPlayer({ name = 'Player2' })
end