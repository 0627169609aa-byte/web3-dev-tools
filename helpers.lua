-- Utility functions for common web3 gaming operations

local helpers = {}

-- Function to convert a hexadecimal string to a decimal number
function helpers.hexToDec(hex)
    return tonumber(hex, 16)
end

-- Function to convert a decimal number to a hexadecimal string
function helpers.decToHex(dec)
    return string.format("%X", dec)
end

-- Function to check if a given string is a valid Ethereum address
function helpers.isValidAddress(address)
    return string.match(address, '^0x[%x]+$') and #address == 42
end

-- Function to generate a random integer within a specified range
function helpers.getRandomInt(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

-- Function to format a timestamp into a readable date
function helpers.formatTimestamp(timestamp)
    return os.date('%Y-%m-%d %H:%M:%S', timestamp)
end

return helpers
