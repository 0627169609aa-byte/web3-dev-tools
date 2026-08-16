-- Configuration settings for the Web3 game

--- @class Config
--- @field rpcUrl string The RPC URL for the blockchain node
--- @field gameId string The unique identifier for the game
--- @field playerRewards table A table storing reward configurations for players
--- @field maxPlayers integer The maximum number of players in the game
local Config = {}

Config.rpcUrl = "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID"
Config.gameId = "game_123"
Config.playerRewards = {
    bronze = { amount = 100, currency = "ETH" },
    silver = { amount = 250, currency = "ETH" },
    gold = { amount = 500, currency = "ETH" }
}
Config.maxPlayers = 100

--- @return Config
function Config:new()
    local instance = setmetatable({}, { __index = self })
    return instance
end

return Config
