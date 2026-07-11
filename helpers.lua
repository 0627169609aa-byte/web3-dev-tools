-- Helper functions for common operations

local M = {}

--- Get the string representation of a number
-- @param num The number to convert
-- @return A string representation of the number
function M.numberToString(num)
    return tostring(num)
end

--- Check if a value is within a range
-- @param value The value to check
-- @param min The minimum value
-- @param max The maximum value
-- @return True if value is within the range, false otherwise
function M.isInRange(value, min, max)
    return value >= min and value <= max
end

--- Shuffle an array
-- @param array The array to shuffle
-- @return A new array that is shuffled
function M.shuffleArray(array)
    local shuffled = {}
    for i = 1, #array do
        local randIndex = math.random(i, #array)
        table.insert(shuffled, array[randIndex])
        array[randIndex] = array[i]
    end
    return shuffled
end

--- Deep clone an object
-- @param obj The object to clone
-- @return A deep clone of the object
function M.deepClone(obj)
    local lookup_table = {}
    local function clone(tbl)
        if type(tbl) ~= 'table' then
            return tbl
        elseif lookup_table[tbl] then
            return lookup_table[tbl]
        end
        local new_table = {}
        lookup_table[tbl] = new_table
        for key, value in pairs(tbl) do
            new_table[clone(key)] = clone(value)
        end
        return new_table
    end
    return clone(obj)
end

return M
