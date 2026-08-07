-- Utility functions for gaming data handling

local json = require('dkjson') -- Assuming dkjson is available for JSON handling

--- Converts gaming data to JSON format
-- @param data table The gaming data to convert
-- @return string JSON representation of the gaming data
local function toJson(data)
    local jsonString, pos, err = json.encode(data)
    if err then
        error('Error encoding to JSON: ' .. err)
    end
    return jsonString
end

--- Parses JSON string into gaming data
-- @param jsonString string The JSON string to parse
-- @return table The gaming data parsed from JSON
local function fromJson(jsonString)
    local data, pos, err = json.decode(jsonString)
    if err then
        error('Error decoding JSON: ' .. err)
    end
    return data
end

--- Merges two gaming data tables into one
-- @param table1 table The first gaming data table
-- @param table2 table The second gaming data table
-- @return table Merged gaming data table
local function mergeData(table1, table2)
    for key, value in pairs(table2) do
        if type(value) == 'table' and type(table1[key]) == 'table' then
            table1[key] = mergeData(table1[key], value)
        else
            table1[key] = value
        end
    end
    return table1
end

return {
    toJson = toJson,
    fromJson = fromJson,
    mergeData = mergeData
}