-- Configuration settings for the web3-dev-tools game

--- @class Config
--- @field rpcUrl string The URL of the RPC provider
--- @field gameId string The unique identifier of the game
--- @field apiKey string The API key for authentication

local Config = {}

--- Initializes the configuration with default values.
--- @return Config The initialized configuration table
function Config:new()
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    instance.rpcUrl = "https://example-rpc-url.com"
    instance.gameId = "unique-game-id"
    instance.apiKey = "your-api-key"
    return instance
end

--- Updates the RPC URL.
--- @param self Config The configuration instance
--- @param url string The new RPC URL
function Config:setRpcUrl(self, url)
    self.rpcUrl = url
end

--- Updates the game ID.
--- @param self Config The configuration instance
--- @param id string The new game ID
function Config:setGameId(self, id)
    self.gameId = id
end

--- Updates the API key.
--- @param self Config The configuration instance
--- @param key string The new API key
function Config:setApiKey(self, key)
    self.apiKey = key
end

return Config
