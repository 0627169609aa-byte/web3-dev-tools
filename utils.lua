-- Utility functions for handling errors in the gaming framework

local M = {}

-- Custom error class for better error handling
local function Error(message)
    return { message = message, type = 'Error' }
end

-- Function to safely execute a callback and handle errors
-- @param callback - the function to execute
-- @param ... - additional arguments to pass to the callback
function M.safeExecute(callback, ...)
    local success, result = pcall(callback, ...)
    if not success then
        return nil, Error('Execution failed: ' .. result)
    end
    return result, nil
end

-- Function to validate player input
-- @param input - the input to validate
function M.validatePlayerInput(input)
    if type(input) ~= 'table' then
        return nil, Error('Invalid input type, expected table')
    end
    if not input.name or type(input.name) ~= 'string' then
        return nil, Error('Player name is required and must be a string')
    end
    if input.age and (type(input.age) ~= 'number' or input.age < 0) then
        return nil, Error('Player age must be a non-negative number')
    end
    return true, nil
end

-- Function to log errors to the console
-- Error message is either from a thrown Error or a simple string
function M.logError(err)
    if type(err) == 'table' and err.type == 'Error' then
        print('Error: ' .. err.message)
    else
        print('Error: ' .. tostring(err))
    end
end

return M