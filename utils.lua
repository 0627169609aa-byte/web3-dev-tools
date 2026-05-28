-- Utility functions for input validation

local function isValidPlayerInput(input)
    if type(input) ~= "string" then
        return false, "Input must be a string"
    end
    if #input == 0 then
        return false, "Input cannot be empty"
    end
    return true, ""
end

local function isValidGameAction(action)
    local validActions = {"move", "attack", "defend", "heal"}
    for _, v in ipairs(validActions) do
        if v == action then
            return true, ""
        end
    end
    return false, "Invalid game action"
end

local function processPlayerInput(input, action)
    local validInput, inputError = isValidPlayerInput(input)
    if not validInput then
        return nil, inputError
    end
    local validAction, actionError = isValidGameAction(action)
    if not validAction then
        return nil, actionError
    end
    -- Proceed with processing if both input and action are valid
    return {input = input, action = action}, nil
end

return {
    processPlayerInput = processPlayerInput
}