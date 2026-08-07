-- Configuration for web3 gaming tools

---@class Config
--- Holds the configuration for game settings.
---@field apiUrl string
---@field gameName string
---@field maxPlayers number
local Config = {}

Config.apiUrl = "https://api.example.com/v1"
Config.gameName = "CryptoBattle"
Config.maxPlayers = 100

--- Get the full configuration
---@return table
function Config:getConfig()
    return {
        apiUrl = self.apiUrl,
        gameName = self.gameName,
        maxPlayers = self.maxPlayers
    }
end

return Config
