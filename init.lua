-- Main processing loop for web3 game

local function validateInput(input)
    if type(input) ~= 'table' then
        return false, 'Input must be a table'
    end
    if not input.action or type(input.action) ~= 'string' then
        return false, 'Input must contain a valid action'
    end
    return true
end

local function processInput(input)
    local isValid, errorMessage = validateInput(input)
    if not isValid then
        print('Error:', errorMessage)
        return
    end

    if input.action == 'start' then
        print('Game started')
    elseif input.action == 'stop' then
        print('Game stopped')
    else
        print('Unknown action')
    end
end

-- Main loop example
while true do
    local userInput = { action = 'start' } -- Example input
    processInput(userInput)
    os.execute('sleep 1')  -- Simulate processing time
end