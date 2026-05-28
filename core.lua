-- Core functionalities for web3 gaming

local core = {}

-- Function to convert hex string to decimal
function core.hexToDecimal(hex)
    return tonumber(hex, 16)
end

-- Function to convert decimal to hex string
function core.decimalToHex(decimal)
    return string.format("%X", decimal)
end

-- Function to generate a unique player ID
function core.generatePlayerID()
    local playerID = "player_" .. math.random(10000, 99999)
    return playerID
end

-- Function to validate Ethereum address
function core.isValidEthereumAddress(address)
    return string.match(address, "^0x[a-fA-F0-9]{40}$") ~= nil
end

-- Function to calculate reward based on score
function core.calculateReward(score)
    local baseReward = 10
    return baseReward * score
end

return core
