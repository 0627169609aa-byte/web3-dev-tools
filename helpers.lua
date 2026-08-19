-- Function to safely retrieve values from a table
local function safeGet(table, key)
    if table == nil then
        error("Table cannot be nil")
    end
    if table[key] == nil then
        return nil, "Key not found: " .. tostring(key)
    end
    return table[key], nil
end

-- Function to validate player input
local function validatePlayerInput(input)
    if type(input) ~= "table" then
        return nil, "Input must be a table"
    end
    if not input.name or not input.id then
        return nil, "Missing required fields: name and id"
    end
    return true, nil
end

-- Central function to handle player registration
local function registerPlayer(players, playerData)
    local valid, err = validatePlayerInput(playerData)
    if not valid then
        return nil, err
    end
    local _, err = safeGet(players, playerData.id)
    if err then
        players[playerData.id] = playerData
        return playerData, nil
    else
        return nil, "Player already exists: " .. playerData.id
    end
end

-- Example usage
local players = {}
local playerData = {id = "001", name = "Alice"}
local player, err = registerPlayer(players, playerData)
if err then
    print("Error registering player:", err)
else
    print("Player registered:", player.name)
end

local playerDataDuplicate = {id = "001", name = "Bob"}
local playerDup, errDup = registerPlayer(players, playerDataDuplicate)
if errDup then
    print("Error registering player:", errDup)
else
    print("Player registered:", playerDup.name)
end
