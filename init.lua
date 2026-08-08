--[[
    init.lua
    This module initializes the web3 gaming environment and manages connection to the blockchain.
    It includes setup functions and configuration loading.
--]]

local json = require('json')
local config = require('config')

--- Initializes the blockchain connection.
-- @param url string The URL of the blockchain node.
-- @return boolean Success status of the connection.
local function initializeBlockchainConnection(url)
    -- Placeholder for actual connection logic
g    print('Connecting to blockchain at: ' .. url)
    -- Here you would add logic to establish the connection.
    return true
end

--- Loads the game configuration.
-- @return table The loaded configuration data.
local function loadConfiguration() 
    local configData = config.load('game_config.json')
    return configData
end

--- Starts the gaming environment.
-- This function will load the configuration, and initialize the connection.
-- @return void
local function startGame() 
    local gameConfig = loadConfiguration()
    local blockchainURL = gameConfig.blockchainURL
    if not initializeBlockchainConnection(blockchainURL) then 
        error('Failed to connect to the blockchain.')
    end
    print('Gaming environment started successfully!')
end

startGame()
