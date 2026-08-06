--[[
    Core helper functions for web3 gaming interactions.
]]

local json = require('dkjson')

local function parseJson(data)
    local obj, pos, err = json.decode(data, 1, nil)
    if err then
        error('JSON parse error: ' .. err)
    end
    return obj
end

local function formatJson(obj)
    local data, err = json.encode(obj)
    if err then
        error('JSON format error: ' .. err)
    end
    return data
end

local function generateRandomID()
    return tostring(math.random(100000, 999999))
end

local function isValidAddress(address)
    return type(address) == 'string' and #address == 42
end

local function timestampNow()
    return os.time(os.date('!*t'))
end

return {
    parseJson = parseJson,
    formatJson = formatJson,
    generateRandomID = generateRandomID,
    isValidAddress = isValidAddress,
    timestampNow = timestampNow
}