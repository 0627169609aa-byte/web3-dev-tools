-- Initialize game settings
local function initializeGameSettings()
    return {
        playerName = "Player1",
        maxPlayers = 4,
        gameSpeed = 1.0
    }
end

-- Validate input settings
local function validateSettings(settings)
    if type(settings.playerName) ~= "string" or settings.playerName == "" then
        error("Invalid player name. It must be a non-empty string.")
    end
    if type(settings.maxPlayers) ~= "number" or settings.maxPlayers < 1 then
        error("Invalid max players. It must be a number greater than 0.")
    end
    if type(settings.gameSpeed) ~= "number" or settings.gameSpeed <= 0 then
        error("Invalid game speed. It must be a number greater than 0.")
    end
end

-- Main processing loop
local function main()
    local gameSettings = initializeGameSettings()
    validateSettings(gameSettings)  

    -- Game loop
    while true do
        print("Game running with settings:", gameSettings.playerName, gameSettings.maxPlayers, gameSettings.gameSpeed)
        -- Simulated game processing...
        os.execute("sleep 1") -- Simulate wait
    end
end

-- Start the game
main()