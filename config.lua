-- Configuration settings for game integration

local config = {}  

-- Game settings
config.gameName = "Web3 Adventure"
config.version = "1.0.0"
config.maxPlayers = 100

-- Blockchain settings
config.blockchain = {}  
config.blockchain.network = "Ethereum"
config.blockchain.contractAddress = "0xYourContractAddressHere"
config.blockchain.gasLimit = 3000000

-- API settings
config.api = {}
config.api.baseUrl = "https://api.web3-gaming.com"
config.api.key = "your_api_key"

-- Rewards settings
config.rewards = {}  
config.rewards.itemRarity = { "common", "rare", "epic", "legendary" }
config.rewards.rewardPoints = { 100, 500, 1000 }

return config
