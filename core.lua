-- Core module for web3 game logic
local Game = {}

-- Initialize a new game instance
function Game:new(name, players)
    local newObj = {name = name, players = players or {}, rounds = {}}
    self.__index = self
    return setmetatable(newObj, self)
end

-- Start a new round in the game
function Game:startRound()
    local round = {scoreboard = {}}
    table.insert(self.rounds, round)
    return round
end

-- Add a score for a player in the current round
function Game:addScore(player, score)
    local currentRound = self.rounds[#self.rounds]
    if currentRound then
        currentRound.scoreboard[player] = (currentRound.scoreboard[player] or 0) + score
    end
end

-- Get the current scoreboard
function Game:getScoreboard()
    local currentRound = self.rounds[#self.rounds]
    return currentRound and currentRound.scoreboard or {}
end

-- Get the game name
function Game:getName()
    return self.name
end

return Game
