--[[]]
-- Helper functions for web3 gaming applications.
--
-- This module contains utility functions that assist in various game-related operations.
--
-- @module helpers

local helpers = {}

--- Validates if a given string is a valid Ethereum address.
-- @param address string: The address string to validate.
-- @return boolean: True if valid, false otherwise.
function helpers.isValidEthereumAddress(address)
    return string.match(address, '^0x[a-fA-F0-9]{40}$') ~= nil
end

--- Generates a random hexadecimal string of a specified length.
-- @param length number: The length of the generated hexadecimal string.
-- @return string: A random hexadecimal string.
function helpers.generateRandomHex(length)
    local charPool = '0123456789abcdef'
    local hexString = ''
    for i = 1, length do
        local randomIndex = math.random(#charPool)
        hexString = hexString .. string.sub(charPool, randomIndex, randomIndex)
    end
    return hexString
end

--- Converts a numeric value to its hexadecimal representation.
-- @param number number: The number to convert.
-- @return string: The hexadecimal representation of the number.
function helpers.toHex(number)
    return string.format('0x%X', number)
end

--- Shuffles a table randomly.
-- @param tbl table: The table to shuffle.
-- @return table: The shuffled table.
function helpers.shuffleTable(tbl)
    math.randomseed(os.time())
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
    return tbl
end

return helpers
