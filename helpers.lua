-- Helper functions for common operations

local M = {}

-- Function to generate a random number within a range
-- @param min: the minimum value
-- @param max: the maximum value
-- @return: a random number between min and max
function M.randomInRange(min, max)
    return math.random(min, max)
end

-- Function to shuffle a table
-- @param t: the table to shuffle
function M.shuffleTable(t)
    for i = #t, 2, -1 do
        local j = M.randomInRange(1, i)
        t[i], t[j] = t[j], t[i]
    end
end

-- Function to check if a value is in a table
-- @param tbl: the table to check
-- @param val: the value to find
-- @return: true if value is found, otherwise false
function M.valueExists(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

-- Function to merge two tables
-- @param tbl1: the first table
-- @param tbl2: the second table
function M.mergeTables(tbl1, tbl2)
    for k, v in pairs(tbl2) do
        tbl1[k] = v
    end
    return tbl1
end

return M
