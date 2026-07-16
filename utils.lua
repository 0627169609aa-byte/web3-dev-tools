-- Utility functions for web3 gaming

local utils = {}

--- Check if a value is nil or empty
-- @param value: value to check
-- @return boolean: true if nil or empty, false otherwise
function utils.isNilOrEmpty(value)
    return value == nil or (type(value) == 'string' and value:match('^%s*$'))
end

--- Safely retrieve a value from a table
-- @param tbl: the table to retrieve from
-- @param key: the key to look up
-- @param default: default value to return if key is not found
-- @return any: the value associated with the key or default
function utils.safeGet(tbl, key, default)
    if type(tbl) ~= 'table' then
        return default
    end
    return tbl[key] ~= nil and tbl[key] or default
end

--- Function to ensure the game settings are valid
-- @param settings: table containing game settings
-- @return boolean: true if valid, false otherwise
function utils.validateSettings(settings)
    if utils.isNilOrEmpty(settings) then
        return false
    end
    local requiredKeys = {'playerName', 'level', 'score'}
    for _, key in ipairs(requiredKeys) do
        if utils.isNilOrEmpty(settings[key]) then
            return false
        end
    end
    return true
end

--- Log error messages with context
-- @param message: error message to log
-- @param context: optional context to provide additional information
function utils.logError(message, context)
    local formattedMessage = 'Error: ' .. message
    if context then
        formattedMessage = formattedMessage .. ' | Context: ' .. tostring(context)
    end
    print(formattedMessage)
end

return utils
