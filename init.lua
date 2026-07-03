-- Initialization for the Web3 Game

local web3 = require('web3')
local config = require('config')

-- Function to initialize web3 provider
local function initWeb3Provider()
    local providerUrl = config.providerUrl
    local web3Instance = web3.new(providerUrl)
    return web3Instance
end

-- Function to retrieve player data from blockchain
local function getPlayerData(playerId)
    local web3Instance = initWeb3Provider()
    local playerContract = web3Instance.contract(config.playerContractAddress)
    local playerData = playerContract.methods.getPlayer(playerId):call()
    return playerData
end

-- Function to update player score on the blockchain
local function updatePlayerScore(playerId, newScore)
    local web3Instance = initWeb3Provider()
    local playerContract = web3Instance.contract(config.playerContractAddress)
    playerContract.methods.updateScore(playerId, newScore):send({from = config.ownerAddress})
end

-- Initialize the application
local function init()
    print('Web3 Gaming App Initialized')
    -- Example usage
    local playerId = 1
    local newScore = 100
    updatePlayerScore(playerId, newScore)
    local playerData = getPlayerData(playerId)
    print('Player Data:', playerData)
end

-- Run the initialization
init()