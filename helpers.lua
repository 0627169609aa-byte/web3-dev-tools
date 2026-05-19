-- Helper functions for common operations

local helpers = {}

--- Function to create a deep copy of a table
-- @param orig The original table to copy
-- @return A new table that is a deep copy of orig
function helpers.deepCopy(orig)
    if type(orig) ~= 'table' then return orig end
    local copy = {}
    for k, v in pairs(orig) do
        copy[k] = helpers.deepCopy(v)
    end
    return copy
end

--- Function to check if a table contains a specific value
-- @param tbl The table to check
-- @param value The value to search for
-- @return True if value is found, false otherwise
function helpers.tableContains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

--- Function to merge two tables
-- @param tbl1 The first table
-- @param tbl2 The second table
-- @return A new table containing the merged results
function helpers.mergeTables(tbl1, tbl2)
    local merged = helpers.deepCopy(tbl1)
    for k, v in pairs(tbl2) do
        merged[k] = v
    end
    return merged
end

return helpers
