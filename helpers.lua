-- Helper functions for game utilities

local M = {}

-- Generates a random number between min and max
function M.random_range(min, max)
    return math.random(min, max)
end

-- Checks if a value exists in a table
function M.table_contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Shuffles a table in place
function M.shuffle_table(t)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end

-- Merges two tables
function M.merge_tables(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

return M
