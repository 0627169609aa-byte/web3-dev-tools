-- Utility function to handle gaming data

local json = require('json')

local Helpers = {}

-- Convert gaming data to JSON format
function Helpers.dataToJson(data)
    local jsonData, err = json.encode(data)
    if err then
        error('JSON encoding error: ' .. err)
    end
    return jsonData
end

-- Parse JSON string to Lua table
function Helpers.jsonToData(jsonString)
    local data, err = json.decode(jsonString)
    if err then
        error('JSON decoding error: ' .. err)
    end
    return data
end

-- Validate if the provided data matches the required structure
function Helpers.validateDataStructure(data, requiredStructure)
    for key, value in pairs(requiredStructure) do
        if data[key] == nil then
            return false, 'Missing key: ' .. key
        end
        if type(data[key]) ~= type(value) then
            return false, 'Key ' .. key .. ' should be of type ' .. type(value)
        end
    end
    return true
end

return Helpers
