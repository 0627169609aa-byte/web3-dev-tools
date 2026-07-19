-- Helper functions for input validation in gaming

local M = {}

-- Validate if input is a positive integer
function M.isPositiveInteger(input)
    return type(input) == "number" and input > 0 and math.floor(input) == input
end

-- Validate if input is a non-empty string
function M.isNonEmptyString(input)
    return type(input) == "string" and #input > 0
end

-- Main processing loop
function M.processInput(playerInput)
    -- Validate input before processing
    if not M.isPositiveInteger(playerInput.level) then
        return "Invalid level: must be a positive integer"
    end

    if not M.isNonEmptyString(playerInput.name) then
        return "Invalid name: must be a non-empty string"
    end

    -- Proceed with processing if inputs are valid
    print(string.format("Processing player: %s with level: %d", playerInput.name, playerInput.level))
    return "Input processed successfully"
end

return M