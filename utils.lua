-- Utility functions for web3 gaming interactions

local utils = {}

-- Check if a value is valid
-- This can be a number or a string in specific formats
-- @param value: the input value to be checked
-- @return boolean: true if valid, false otherwise
function utils.isValidValue(value)
    if type(value) == 'number' then
        return value > 0
    elseif type(value) == 'string' then
        return value ~= '' and value:match('^[A-Za-z0-9]+$')
    end
    return false
end

-- Safely divide two numbers, handling edge cases
-- @param numerator: the top number in a division
-- @param denominator: the bottom number in a division
-- @return number: result of division or error message
function utils.safeDivide(numerator, denominator)
    if type(numerator) ~= 'number' or type(denominator) ~= 'number' then
        return 'Error: both numerator and denominator must be numbers'
    end
    if denominator == 0 then
        return 'Error: division by zero'
    end
    return numerator / denominator
end

-- Retrieve a value from a table with error handling
-- @param tbl: the table to retrieve from
-- @param key: the key to look for
-- @return value or error message
function utils.getValueSafely(tbl, key)
    if type(tbl) ~= 'table' then
        return 'Error: provided input is not a table'
    end
    if tbl[key] == nil then
        return 'Error: key does not exist in table'
    end
    return tbl[key]
end

return utils
