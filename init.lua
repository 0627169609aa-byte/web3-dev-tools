-- Initialization function for the game
local function initializeGame(playerName, playerLevel)
    if not validateInput(playerName, playerLevel) then
        return nil, "Invalid input"
    end
    -- Proceed to initialize the game with valid inputs
    print("Initializing game for " .. playerName .. " at level " .. playerLevel)
    -- Game initialization logic goes here
end

-- Function to validate inputs
local function validateInput(name, level)
    if type(name) ~= "string" or #name == 0 then
        print("Error: Player name must be a non-empty string")
        return false
    end
    if type(level) ~= "number" or level < 1 or level > 100 then
        print("Error: Player level must be a number between 1 and 100")
        return false
    end
    return true
end

-- Main processing loop
local function main()
    local playerName = "Alice"
    local playerLevel = 10
    local success, err = initializeGame(playerName, playerLevel)
    if not success then
        print(err)
        return
    end
    -- Continue with main game loop
    print("Game started successfully!")
end

main()