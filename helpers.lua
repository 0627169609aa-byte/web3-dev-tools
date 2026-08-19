--[[
  Helper functions for error handling in gaming context
]]

local helpers = {}

-- Custom error class for more descriptive error handling
local function CustomError(message)
    local self = setmetatable({}, {__index = CustomError})
    self.message = message or "An error occurred"
    return self
end

function helpers.handleError(err)
    if type(err) == "table" and err.message then
        print("Error: " .. err.message)
    else
        print("Error: " .. tostring(err))
    end
end

function helpers.safeExecute(func, ...)
    local status, result = pcall(func, ...)
    if not status then
        helpers.handleError(CustomError(result))
        return nil
    end
    return result
end

function helpers.validateInput(input)
    if type(input) ~= "string" or input == "" then
        error(CustomError("Invalid input: must be a non-empty string"))
    end
    return true
end

return helpers
