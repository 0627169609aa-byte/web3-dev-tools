--[[]]
-- @module helpers
-- @description This module provides utility functions for web3 gaming development.
-- @copyright 2023

local helpers = {}

--- Get the current timestamp in milliseconds.
-- @return number The current timestamp in milliseconds.
function helpers.getCurrentTimestamp()
    return os.time() * 1000
end

--- Check if a given value is a valid address.
-- @param address string The address to check.
-- @return boolean True if valid, otherwise false.
function helpers.isValidAddress(address)
    return type(address) == 'string' and string.match(address, '^0x[a-fA-F0-9]{40}$') ~= nil
end

--- Format a number to a fixed decimal point.
-- @param number number The number to format.
-- @param decimals number The number of decimal places.
-- @return string The formatted number as a string.
function helpers.formatNumber(number, decimals)
    return string.format('%.*f', decimals, number)
end

--- Generate a random unique identifier for players.
-- @return string A random unique identifier.
function helpers.generateUniqueId()
    return 'uid_' .. tostring(math.random(100000, 999999)) .. '_' .. tostring(os.time())
end

return helpers
