-- Utility functions for the Web3 Gaming

local utils = {}

-- Check if a value exists in a table
function utils.contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

-- Convert a hex string to a byte array
function utils.hexToBytes(hex)
    local bytes = {}
    for i = 1, #hex, 2 do
        local byte = tonumber(hex:sub(i, i + 1), 16)
        table.insert(bytes, byte)
    end
    return bytes
end

-- Generate a random string of given length
function utils.randomString(length)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local result = ''
    for _ = 1, length do
        local index = math.random(1, #chars)
        result = result .. chars:sub(index, index)
    end
    return result
end

-- Format a timestamp into a human-readable string
function utils.formatTimestamp(timestamp)
    return os.date('%Y-%m-%d %H:%M:%S', timestamp)
end

return utils