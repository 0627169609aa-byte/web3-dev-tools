-- Utility functions for error handling in gaming

local M = {}

--- Checks if a value is nil and returns an error message
-- @param value The value to check
-- @param msg The custom error message
-- @return The original value or an error
function M.checkNil(value, msg)
    if value == nil then
        error(msg or 'Value cannot be nil')
    end
    return value
end

--- Safely attempts to execute a function and catches errors
-- @param func The function to execute
-- @return success status and result or error message
function M.safeExecute(func)
    local success, result = pcall(func)
    if not success then
        return false, 'Error: ' .. result
    end
    return true, result
end

--- Validates a number against a range
-- @param num The number to validate
-- @param min The minimum acceptable value
-- @param max The maximum acceptable value
-- @return The original number or an error message
function M.validateNumberRange(num, min, max)
    M.checkNil(num, 'Number must not be nil')
    if num < min or num > max then
        error(string.format('Number %d is out of range (%d - %d)', num, min, max))
    end
    return num
end

return M