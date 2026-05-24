-- Utility functions for common operations

local utils = {}

--- Check if a string is empty.
-- @param str The string to check.
-- @return boolean indicating if the string is empty.
function utils.isEmpty(str)
    return str == nil or str == ''
end

--- Generate a random integer within a range.
-- @param min The minimum value (inclusive).
-- @param max The maximum value (inclusive).
-- @return A random integer between min and max.
function utils.randomRange(min, max)
    return math.random(min, max)
end

--- Shuffle an array in place.
-- @param tbl The table (array) to shuffle.
function utils.shuffleArray(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

--- Deep copy a table.
-- @param orig The table to copy.
-- @return A new table that is a deep copy of orig.
function utils.deepCopy(orig)
    local copy
    if type(orig) == 'table' then
        copy = {}
        for key, value in next, orig, nil do
            copy[utils.deepCopy(key)] = utils.deepCopy(value)
        end
        setmetatable(copy, utils.deepCopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

return utils