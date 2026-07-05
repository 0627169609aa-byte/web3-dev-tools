-- Utility functions for gaming data handling

local GameUtils = {}

-- Converts a table of player data to JSON format
function GameUtils.playersToJson(players)
    local json = require('json')  -- assume a JSON library is available
    local jsonString, err = json.encode(players)
    if err then
        error('Failed to encode players to JSON: ' .. err)
    end
    return jsonString
end

-- Parses JSON string back to table of player data
function GameUtils.jsonToPlayers(jsonString)
    local json = require('json')  -- assume a JSON library is available
    local players, err = json.decode(jsonString)
    if err then
        error('Failed to decode JSON to players: ' .. err)
    end
    return players
end

-- Filters players based on a specific attribute
function GameUtils.filterPlayersByAttribute(players, attribute, value)
    local filteredPlayers = {}
    for _, player in ipairs(players) do
        if player[attribute] == value then
            table.insert(filteredPlayers, player)
        end
    end
    return filteredPlayers
end

return GameUtils