--[[
    Web3 Gaming Core Module
    This module contains the core functionality
    for managing game state and player interactions.
--]]

local GameCore = {}
local players = {}
local gameState = { active = false, turn = 1 }

--- Initializes the game settings
function GameCore.initializeGame()
    gameState.active = true
    gameState.turn = 1
    players = {}
end

--- Adds a player to the game
-- @param name: the player's name
function GameCore.addPlayer(name)
    if not gameState.active then
        error("Game is not active!")
    end
    table.insert(players, { name = name, score = 0 })
end

--- Advances the turn in the game
function GameCore.nextTurn()
    if not gameState.active then
        error("Game is not active!")
    end
    gameState.turn = gameState.turn + 1
end

--- Ends the current game
function GameCore.endGame()
    gameState.active = false
    return players
end

--- Gets the current game state
-- @return: current state of the game
function GameCore.getGameState()
    return gameState
end

return GameCore