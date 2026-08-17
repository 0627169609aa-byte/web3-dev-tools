-- Initializes the game environment and configures web3 settings

local function setupWeb3()  
    -- Placeholder for web3 settings  
    local web3 = require('web3')  
    return web3.new('https://localhost:8545')  
end

local function loadAssets()  
    -- Load game assets like images and sounds  
    local assets = {  
        background = love.graphics.newImage('assets/background.png'),  
        player = love.graphics.newImage('assets/player.png'),  
    }  
    return assets  
end

local function initializeGame()  
    local web3Instance = setupWeb3()  
    local assets = loadAssets()  
    -- Initialize game state
    local state = { web3 = web3Instance, assets = assets }  
    return state  
end

function love.load()  
    local gameState = initializeGame()  
    -- Store the game state globally for access in other functions  
    _G.gameState = gameState  
end

function love.draw()  
    love.graphics.draw(gameState.assets.background, 0, 0)  
    love.graphics.draw(gameState.assets.player, 100, 100)  
end
