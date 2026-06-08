-- Utility functions for web3 gaming

-- Generates a random token ID
local function generateTokenId()
    math.randomseed(os.time())
    return math.random(100000, 999999)
end

-- Validates if a given address is a valid Ethereum address
local function isValidEthereumAddress(address)
    return string.match(address, '^0x[a-fA-F0-9]{40}$') ~= nil
end

-- Converts a hex string to a decimal number
local function hexToDecimal(hex)
    return tonumber(hex, 16)
end

-- Formats a number to a fixed decimal point
local function formatNumber(num, decimalPoints)
    return string.format('%.' .. (decimalPoints or 2) .. 'f', num)
end

-- Exports the utility functions
return {
    generateTokenId = generateTokenId,
    isValidEthereumAddress = isValidEthereumAddress,
    hexToDecimal = hexToDecimal,
    formatNumber = formatNumber
}