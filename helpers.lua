--[[
    helpers.lua
    A module for input validation functions in a web3 gaming context.
]]--

local M = {}

-- Function to validate a string input
function M.validateString(input)
    return type(input) == 'string' and #input > 0
end

-- Function to validate a number input
function M.validateNumber(input)
    return type(input) == 'number' and input > 0
end

-- Function to validate an array input
function M.validateArray(input)
    return type(input) == 'table' and #input > 0
end

-- Main processing loop example
function M.processInput(input)
    if not M.validateString(input.name) then
        return { success = false, message = 'Invalid name provided' }
    end

    if not M.validateNumber(input.age) then
        return { success = false, message = 'Invalid age provided' }
    end

    if not M.validateArray(input.items) then
        return { success = false, message = 'Invalid items array' }
    end

    return { success = true, message = 'Input is valid' }
end

return M
