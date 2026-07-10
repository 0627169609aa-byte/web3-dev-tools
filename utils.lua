-- Utility functions for gaming data handling

local utils = {}

--- Parse JSON string to Lua table
-- @param jsonString: string containing JSON data
-- @return table: Lua table representation of the JSON
function utils.parseJSON(jsonString)
    local success, result = pcall(function()
        return game:GetService('HttpService'):JSONDecode(jsonString)
    end)
    if not success then
        error('Failed to parse JSON: ' .. tostring(result))
    end
    return result
end

--- Convert Lua table to JSON string
-- @param luaTable: table to convert to JSON
-- @return string: JSON representation of the Lua table
function utils.convertToJSON(luaTable)
    local success, result = pcall(function()
        return game:GetService('HttpService'):JSONEncode(luaTable)
    end)
    if not success then
        error('Failed to convert to JSON: ' .. tostring(result))
    end
    return result
end

--- Deep copy a table
-- @param original: table to be copied
-- @return table: new deep copied table
function utils.deepCopy(original)
    local copy
    if type(original) == 'table' then
        copy = {}
        for key, value in next, original, nil do
            copy[utils.deepCopy(key)] = utils.deepCopy(value)
        end
        setmetatable(copy, utils.deepCopy(getmetatable(original)))
    else -- number, string, boolean, etc
        copy = original
    end
    return copy
end

return utils