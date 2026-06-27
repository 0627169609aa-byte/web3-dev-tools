-- Main processing loop with input validation

local function isValidInput(input)
    return type(input) == 'string' and #input > 0
end

local function processInput(input)
    if not isValidInput(input) then
        error('Invalid input: must be a non-empty string')
    end
    -- Process the validated input
    print('Processing input: ' .. input)
end

local function main()
    local inputs = {'valid string', '', nil}
    for _, input in ipairs(inputs) do
        pcall(processInput, input)
    end
end

main()
