-- Input validation helper functions

local M = {}

-- Validate if the input is a number
function M.validateNumber(input)
    return type(input) == 'number'
end

-- Validate if the input is a string
function M.validateString(input)
    return type(input) == 'string' and #input > 0
end

-- Validate if the input is one of the accepted values
function M.validateEnum(input, accepted)
    for _, value in ipairs(accepted) do
        if input == value then
            return true
        end
    end
    return false
end

-- Main processing loop which uses input validation
function M.processInput(input)
    local acceptedTypes = {"start", "stop", "pause"}

    if not M.validateNumber(input.id) then
        error("Invalid input: id must be a number")
    end

    if not M.validateString(input.name) then
        error("Invalid input: name must be a non-empty string")
    end

    if not M.validateEnum(input.action, acceptedTypes) then
        error("Invalid input: action must be one of 'start', 'stop', 'pause'")
    end

    -- Process the validated input
    print(string.format("Processing %s with id %d and action %s", input.name, input.id, input.action))
end

return M
