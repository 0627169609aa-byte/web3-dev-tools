-- Utility functions for web3 gaming

local utils = {}

-- Function to generate a random ID
-- @param length: The length of the random ID
-- @return: Randomly generated ID as a string
function utils.generateRandomId(length)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local result = ''
    for i = 1, length do
        local index = math.random(1, #chars)
        result = result .. chars:sub(index, index)
    end
    return result
end

-- Function to convert a timestamp to a formatted date
-- @param timestamp: The timestamp to format
-- @return: Formatted date string
function utils.formatTimestamp(timestamp)
    local date = os.date('*t', timestamp)
    return string.format('%02d-%02d-%04d %02d:%02d:%02d', date.day, date.month, date.year, date.hour, date.min, date.sec)
end

-- Function to validate an Ethereum address
-- @param address: The Ethereum address to validate
-- @return: Boolean indicating if the address is valid
function utils.isValidEthereumAddress(address)
    return string.match(address, '^0x[a-fA-F0-9]{40}$') ~= nil
end

return utils