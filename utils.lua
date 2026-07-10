local json = require('json')

local function validatePlayerData(data)
    if not data.name or type(data.name) ~= 'string' then
        return false, 'Invalid player name.'
    end
    if not data.score or type(data.score) ~= 'number' then
        return false, 'Invalid player score.'
    end
    return true, nil
end

local function savePlayerData(filePath, playerData)
    local isValid, err = validatePlayerData(playerData)
    if not isValid then
        return nil, err
    end
    local file, err = io.open(filePath, 'w')
    if not file then
        return nil, 'Could not open file: ' .. err
    end
    local jsonData = json.encode(playerData)
    file:write(jsonData)
    file:close()
    return true
end

local function loadPlayerData(filePath)
    local file, err = io.open(filePath, 'r')
    if not file then
        return nil, 'Could not open file: ' .. err
    end
    local jsonData = file:read('*a')
    file:close()
    local playerData, pos, err = json.decode(jsonData, 1, nil)
    if err then
        return nil, 'JSON decode error at position ' .. pos .. ': ' .. err
    end
    return playerData
end

return {
    savePlayerData = savePlayerData,
    loadPlayerData = loadPlayerData
}