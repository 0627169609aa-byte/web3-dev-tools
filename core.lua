-- Main game loop for processing player actions
local function validateInput(input)
    if type(input) ~= "string" or #input == 0 then
        return false, "Input must be a non-empty string."
    end
    return true, nil
end

local function processPlayerAction(action)
    local isValid, errMsg = validateInput(action)
    if not isValid then
        print(errMsg)
        return
    end
    -- Process the valid action here
    print("Processing action: ", action)
end

local function mainLoop()
    while true do
        local playerInput = io.read()  -- Read input from the player
        processPlayerAction(playerInput)
    end
end

mainLoop()