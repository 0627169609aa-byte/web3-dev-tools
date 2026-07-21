-- Helper functions for common gaming operations

-- Check if a table is empty
local function isEmpty(table)
    return next(table) == nil
end

-- Deep copy a table
local function deepCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == 'table' then
            copy[key] = deepCopy(value)
        else
            copy[key] = value
        end
    end
    return copy
end

-- Generate a random number in a given range
local function randomRange(min, max)
    math.randomseed(os.time())  -- Seed the random number generator
    return math.random(min, max)
end

-- Check if a value exists in a table
local function valueExists(value, tbl)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

return {
    isEmpty = isEmpty,
    deepCopy = deepCopy,
    randomRange = randomRange,
    valueExists = valueExists,
}