-- Utility functions for web3 gaming

local utils = {}

--- Generates a random number between min and max.
-- @param min The minimum number
-- @param max The maximum number
-- @return A random number between min and max
function utils.randomBetween(min, max)
    return math.random(min, max)
end

--- Formats a timestamp into a human-readable date string.
-- @param timestamp The timestamp to format
-- @return A formatted date string
function utils.formatDate(timestamp)
    local date = os.date('*t', timestamp)
    return string.format('%04d-%02d-%02d %02d:%02d:%02d', 
        date.year, date.month, date.day, date.hour, date.min, date.sec)
end

--- Checks if a value is in a table.
-- @param value The value to check
-- @param tbl The table to check in
-- @return True if value is found, false otherwise
function utils.contains(value, tbl)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

--- Merges two tables into one. If keys are the same, the values from the second table will overwrite the first.
-- @param tbl1 The first table
-- @param tbl2 The second table
-- @return A new table containing keys and values from both tables
function utils.mergeTables(tbl1, tbl2)
    local merged = {}
    for k, v in pairs(tbl1) do
        merged[k] = v
    end
    for k, v in pairs(tbl2) do
        merged[k] = v
    end
    return merged
end

return utils
