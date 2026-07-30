-- Core Game Logic for Web3 Gaming

local Game = {}

Game.players = {}

-- Function to add a player to the game
function Game:addPlayer(playerID, playerData)
    self.players[playerID] = playerData
end

-- Function to remove a player from the game
function Game:removePlayer(playerID)
    if self.players[playerID] then
        self.players[playerID] = nil
    end
end

-- Function to get player data
function Game:getPlayer(playerID)
    return self.players[playerID]
end

-- Function to update player score
function Game:updateScore(playerID, points)
    if self.players[playerID] then
        self.players[playerID].score = (self.players[playerID].score or 0) + points
    end
end

-- Function to list all players
function Game:listPlayers()
    local playerList = {}
    for id, data in pairs(self.players) do
        table.insert(playerList, {id = id, score = data.score or 0})
    end
    return playerList
end

return Game
