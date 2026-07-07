-- Configuration for web3-dev-tools

local Config = {}

-- Default settings
Config.settings = {
    rpcUrl = "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID",
    defaultGasLimit = 500000,
    defaultGasPrice = 1000000000,
}

-- Function to validate RPC URL
local function isValidUrl(url)
    return url and url:match('^https?://') ~= nil
end

-- Function to set RPC URL
function Config.setRpcUrl(newUrl)
    if not isValidUrl(newUrl) then
        error("Invalid RPC URL provided: " .. tostring(newUrl))
    end
    Config.settings.rpcUrl = newUrl
end

-- Function to update gas settings
function Config.updateGasSettings(gasLimit, gasPrice)
    if type(gasLimit) ~= "number" or gasLimit <= 0 then
        error("Gas limit must be a positive number")
    end
    if type(gasPrice) ~= "number" or gasPrice < 0 then
        error("Gas price must be a non-negative number")
    end
    Config.settings.defaultGasLimit = gasLimit
    Config.settings.defaultGasPrice = gasPrice
end

-- Function to retrieve current settings
function Config.getSettings()
    return Config.settings
end

return Config
