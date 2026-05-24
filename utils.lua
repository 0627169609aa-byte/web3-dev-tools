-- Utility functions for common operations

local Utils = {}

--- Check if a value is present in a table
-- @param tbl The table to check
-- @param value The value to find
-- @return boolean True if value is found
function Utils.contains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

--- Merge two tables
-- @param tbl1 The first table
-- @param tbl2 The second table
-- @return table Merged table
function Utils.merge(tbl1, tbl2)
    local merged = {}
    for k, v in pairs(tbl1) do
        merged[k] = v
    end
    for k, v in pairs(tbl2) do
        merged[k] = v
    end
    return merged
end

--- Generate a random number within a range
-- @param min The minimum value
-- @param max The maximum value
-- @return number A random number between min and max
function Utils.random(min, max)
    return math.random(min, max)
end

--- Convert a hexadecimal string to RGB
-- @param hex The hexadecimal color string
-- @return table RGB value as table {r, g, b}
function Utils.hexToRGB(hex)
    hex = hex:gsub('#', '')
    return {
        tonumber(hex:sub(1, 2), 16),
        tonumber(hex:sub(3, 4), 16),
        tonumber(hex:sub(5, 6), 16)
    }
end

return Utils