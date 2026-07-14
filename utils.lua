-- Input validation utility functions

local function isValidInput(input)
    -- Check if input is not nil and is a string
    if input == nil or type(input) ~= 'string' then
        return false, 'Input must be a non-nil string'
    end
    -- Check if input length is within acceptable bounds
    if #input < 3 or #input > 50 then
        return false, 'Input length must be between 3 and 50 characters'
    end
    return true
end

local function processInput(input)
    local isValid, errMsg = isValidInput(input)
    if not isValid then
        print('Input error:', errMsg)
        return
    end
    -- Process the valid input
    -- Here you can add your game-specific logic, such as storing player names
    print('Processing input:', input)
end

-- Main processing loop example
local function main()
    local inputs = {'Player1', 'Pl', nil, 'This is a test input exceeding length limit because it is too long', 'ValidPlayer'}
    for _, input in ipairs(inputs) do
        processInput(input)
    end
end

return {
    isValidInput = isValidInput,
    processInput = processInput,
    main = main
}