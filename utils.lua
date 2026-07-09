-- Utility functions for web3 gaming

local utils = {}

-- Check if a value is a valid address
function utils.isValidAddress(address)
    return type(address) == 'string' and string.match(address, '^0x[%x]+$')
end

-- Convert a hex string to decimal
function utils.hexToDecimal(hex)
    return tonumber(hex, 16)
end

-- Format a timestamp to a readable string
function utils.formatTimestamp(timestamp)
    local date = os.date('*t', timestamp)
    return string.format('%04d-%02d-%02d %02d:%02d:%02d', 
        date.year, date.month, date.day, date.hour, date.min, date.sec)
end

-- Generate a random ID
function utils.randomID(length)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local id = ''
    for i = 1, length do
        local index = math.random(1, #chars)
        id = id .. chars:sub(index, index)
    end
    return id
end

-- Export the utils module
return utils
