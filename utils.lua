-- Utility functions for input validation

local function isValidPlayerName(name)
    return type(name) == 'string' and #name > 0 and #name <= 20
end

local function isValidGameAction(action)
    local validActions = { 'move', 'jump', 'attack', 'defend' }
    for _, v in ipairs(validActions) do
        if v == action then
            return true
        end
    end
    return false
end

local function validateInputs(playerName, action)
    if not isValidPlayerName(playerName) then
        return false, 'Invalid player name. Must be a non-empty string up to 20 characters.'
    end
    if not isValidGameAction(action) then
        return false, 'Invalid action. Must be one of: move, jump, attack, defend.'
    end
    return true, 'Valid inputs.'
end

-- Main processing loop for handling player actions
local function mainProcessingLoop(playerName, action)
    local isValid, message = validateInputs(playerName, action)
    if not isValid then
        print('Validation Error: ' .. message)
        return
    end
    -- Continue with processing the action...
    print('Processing action: ' .. action .. ' for player: ' .. playerName)
end

return {
    mainProcessingLoop = mainProcessingLoop,
    validateInputs = validateInputs
}