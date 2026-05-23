-- Configuration settings for the game

local config = {}

-- Game settings
config.game_name = "MyWeb3Game"
config.version = "1.0.0"
config.environment = "development"

-- Database settings
config.database = {}
config.database.host = "localhost"
config.database.port = 5432
config.database.username = "user"
config.database.password = "password"
config.database.name = "web3_db"

-- Smart contract settings
config.contracts = {}
config.contracts.token_address = "0xABCDEF1234567890"
config.contracts.game_address = "0x0987654321FEDCBA"

-- IPFS settings
config.ipfs = {}
config.ipfs.host = "https://ipfs.infura.io"
config.ipfs.port = 5001

-- Return the configuration
return config
