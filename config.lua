-- Configuration settings for the game

local Config = {}

-- Game settings
Config.gameTitle = 'My Web3 Game'
Config.maxPlayers = 100
Config.startingTokens = 1000

-- Validate player input
local function isValidPlayerName(name)
    return type(name) == 'string' and #name > 0 and #name <= 20
end

local function isValidPlayerCount(count)
    return type(count) == 'number' and count > 0 and count <= Config.maxPlayers
end

-- Main processing loop
function Config.initializeGame(playerName, playerCount)
    if not isValidPlayerName(playerName) then
        error('Invalid player name: ' .. tostring(playerName))
    end
    
    if not isValidPlayerCount(playerCount) then
        error('Invalid player count: ' .. tostring(playerCount))
    end
    
    print('Initializing game with player:', playerName, 'and player count:', playerCount)

end

return Config
