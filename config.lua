-- Configuration module for web3 gaming

--- @class Config
--- @field gameName string Name of the game
--- @field version string Version of the game
--- @field apiUrl string URL for the API

local Config = {}

--- Initializes the configuration with default values.
--- @return Config The initialized configuration
function Config:new()
    local instance = {
        gameName = 'Web3Game',
        version = '1.0.0',
        apiUrl = 'https://api.web3game.com'
    }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

--- Updates the API URL.
--- @param newUrl string The new API URL
function Config:updateApiUrl(newUrl)
    self.apiUrl = newUrl
end

--- Get the current configuration as a table.
--- @return table A table representation of the configuration
function Config:getConfig()
    return {
        gameName = self.gameName,
        version = self.version,
        apiUrl = self.apiUrl
    }
end

return Config
