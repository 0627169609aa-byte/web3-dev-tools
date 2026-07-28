-- Utility function for safe data access
local function safeGet(table, key, default)
    if table[key] ~= nil then
        return table[key]
    else
        return default
    end
end

-- Function to process game data with error handling
local function processGameData(gameData)
    -- Check if gameData is a table
    if type(gameData) ~= 'table' then
        error('Invalid game data: expected a table')
    end

    -- Access necessary fields with default values
    local gameId = safeGet(gameData, 'id', -1)
    local gameName = safeGet(gameData, 'name', 'Unknown')

    if gameId <= 0 then
        return nil, 'Invalid game ID'
    end

    -- Process game content
    local result, err = pcall(function()
        -- Simulated processing logic
        return { id = gameId, name = gameName:upper() }
    end)

    if not result then
        return nil, 'Error processing game data: ' .. err
    end

    return result
end

-- Exported function
return {
    processGameData = processGameData
}
