-- Utility functions for gaming data handling

local Utils = {}

--- Splits a string by a given delimiter
-- @param str The input string
-- @param delimiter The character to split on
-- @return table A table of split strings
function Utils.splitString(str, delimiter)
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

--- Calculates the average value of a table
-- @param values A table of numbers
-- @return number The average value
function Utils.calculateAverage(values)
    local sum = 0
    for _, value in ipairs(values) do
        sum = sum + value
    end
    return #values > 0 and (sum / #values) or 0
end

--- Merges two tables into one
-- @param t1 The first table
-- @param t2 The second table
-- @return table A new table that combines both
function Utils.mergeTables(t1, t2)
    local merged = {}
    for k, v in pairs(t1) do
        merged[k] = v
    end
    for k, v in pairs(t2) do
        merged[k] = v
    end
    return merged
end

return Utils
