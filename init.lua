-- Input validation for game session

local function isValidInput(input)
    return type(input) == "string" and #input > 0
end

local function processGameInput(input)
    if not isValidInput(input) then
        print("Invalid input. Please provide a non-empty string.")
        return
    end

    -- Process the valid game input
    print("Processing game input: " .. input)
    -- Add game logic here
end

local function mainLoop()
    while true do
        io.write("Enter game command: ")
        local userInput = io.read()
        processGameInput(userInput)
    end
end

-- Start the main processing loop
mainLoop()
