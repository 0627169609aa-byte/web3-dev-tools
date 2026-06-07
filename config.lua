-- Configuration settings for the web3 game

local Config = {}

-- Blockchain network settings
Config.network = {
    name = "mainnet",
    rpcUrl = "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID",
    chainId = 1,
}

-- Game settings
Config.game = {
    name = "MyWeb3Game",
    version = "1.0.0",
    maxPlayers = 100,
    startingCoins = 1000,
}

-- API settings
Config.api = {
    endpoint = "https://api.myweb3game.com",
    timeout = 5000,  -- Timeout in milliseconds
}

-- Function to load the configuration
function Config.load()  
    -- Here you can add code to load config from a file if needed
    return Config
end

return Config