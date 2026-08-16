-- Utility functions for web3 gaming

local utils = {}

-- Check if a given string is empty
function utils.isEmpty(str)
    return str == nil or str == ''
end

-- Convert a hexadecimal string to a decimal number
function utils.hexToDecimal(hex)
    return tonumber(hex, 16)
end

-- Generate a random number within a specified range
function utils.randomInRange(min, max)
    return math.random(min, max)
end

-- Format a number to a specified number of decimal places
function utils.formatNumber(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return tostring(math.floor(num * mult + 0.5) / mult)
end

-- Shuffle a table randomly
function utils.shuffle(table)
    local shuffled = {}
    for i = 1, #table do
        local randIndex = math.random(1, i)
        shuffled[i] = shuffled[randIndex] or table[i]
        shuffled[randIndex] = table[i]
    end
    return shuffled
end

return utils
