-- Utility functions for web3 gaming

local utils = {}

-- Generates a unique token ID
function utils.generateTokenId()
    return math.random(100000, 999999)
end

-- Validates an Ethereum address
function utils.isValidEthereumAddress(address)
    if type(address) ~= 'string' then return false end
    return string.match(address, '^0x[a-fA-F0-9]{40}$') ~= nil
end

-- Converts a hex value to decimal
function utils.hexToDecimal(hex)
    return tonumber(hex, 16)
end

-- Formats a number with commas
function utils.formatNumber(number)
    return string.format('%d', number):reverse():gsub('(%d%d%d)', '%1,'):reverse()
end

-- Returns the current timestamp
function utils.getCurrentTimestamp()
    return os.time()
end

return utils