-- Configuration settings for the game

local config = {}

-- Game settings
config.gameName = "My Game"
config.maxPlayers = 100
config.gameMode = "multiplayer"

-- Input validation function
local function validateInput(input)
    if type(input) ~= "string" then
        return false, "Input must be a string"
    end
    if #input == 0 then
        return false, "Input cannot be empty"
    end
    return true
end

-- Main processing loop
function config.processInput(userInput)
    local isValid, err = validateInput(userInput)
    if not isValid then
        print("Input Error: " .. err)
        return
    end
    -- Process valid input
    print("Processing input: " .. userInput)
end

return config
