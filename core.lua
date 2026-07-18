-- Core module for web3 gaming utilities

local core = {}

-- Initialize game settings
function core.initializeGameSettings(settings)
    local gameSettings = {}
    gameSettings.title = settings.title or 'Default Game'
    gameSettings.maxPlayers = settings.maxPlayers or 4
    gameSettings.allowSpectators = settings.allowSpectators or false
    return gameSettings
end

-- Create player profile
function core.createPlayerProfile(name, id)
    local player = {}
    player.name = name
    player.id = id
    player.score = 0
    player.inventory = {}
    return player
end

-- Update player score
function core.updatePlayerScore(player, points)
    if player and type(points) == 'number' then
        player.score = player.score + points
        return player.score
    else
        error('Invalid player or points')
    end
end

-- Add item to player inventory
function core.addItemToInventory(player, item)
    if player and item then
        table.insert(player.inventory, item)
        return player.inventory
    else
        error('Invalid player or item')
    end
end

return core
