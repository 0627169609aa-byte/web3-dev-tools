-- Utility functions for web3 gaming operations

local utils = {}

-- Convert a hexadecimal string to a decimal number
function utils.hexToDec(hex)
    return tonumber(hex, 16)
end

-- Convert a decimal number to a hexadecimal string
function utils.decToHex(dec)
    return string.format("%x", dec)
end

-- Validate if a string is a proper Ethereum address
function utils.isValidAddress(address)
    return string.match(address, "^0x[a-fA-F0-9]{40}$") ~= nil
end

-- Generate a random number between min and max
function utils.random(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

-- Deep copy a table
function utils.deepcopy(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == "table" then
            copy[key] = utils.deepcopy(value)
        else
            copy[key] = value
        end
    end
    return copy
end

return utils