-- Main processing loop for game
local function processInput(userInput)
    -- Input validation function
    local function isValidInput(input)
        return type(input) == 'string' and #input > 0
    end

    -- Validate user input
    if not isValidInput(userInput) then
        print('Invalid input. Please enter a non-empty string.')
        return
    end

    -- Process the valid input
    print('Processing input: ' .. userInput)
    -- (Add further processing logic here)
end

-- Example usage
while true do
    print('Enter your command:')
    local userInput = io.read()
    processInput(userInput)
end
