-- Main processing loop

local function isValidInput(input)
    return type(input) == "table" and input.id and input.value
end

local function processInput(input)
    if not isValidInput(input) then
        error("Invalid input: must be a table with 'id' and 'value'")
    end

    -- Process the valid input
    print(string.format("Processing input with ID: %s and Value: %s", input.id, input.value))
    -- Add your processing logic here
end

local function mainLoop(inputs)
    for _, input in ipairs(inputs) do
        local status, err = pcall(processInput, input)
        if not status then
            print("Error processing input:", err)
        end
    end
end

-- Example usage with sample inputs
local inputs = {
    {id = 1, value = "player1"},
    {value = "player2"},  -- Invalid input
    {id = 3, value = "player3"}
}

mainLoop(inputs)
