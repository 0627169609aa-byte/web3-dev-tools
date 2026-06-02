-- Utility functions for web3 gaming

local utils = {}

-- Converts a string to a number safely
function utils.safeStringToNumber(value)
    if type(value) ~= "string" then
        return nil, "Value is not a string"
    end
    local num = tonumber(value)
    return num, num ~= nil and nil or "Conversion failed"
end

-- Checks if a table is empty
function utils.isTableEmpty(tbl)
    return next(tbl) == nil
end

-- Deep copies a table
function utils.deepCopy(orig)
    local orig_type = type(orig)
    local copy

    if orig_type == "table" then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[utils.deepCopy(orig_key)] = utils.deepCopy(orig_value)
        end
        setmetatable(copy, utils.deepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Formats a timestamp into a readable date
function utils.formatTimestamp(timestamp)
    local date = os.date("!*t", timestamp)
    return string.format("%04d-%02d-%02d %02d:%02d:%02d", date.year, date.month, date.day, date.hour, date.min, date.sec)
end

return utils
