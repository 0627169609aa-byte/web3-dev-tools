-- Utility functions for common operations

local utils = {}

-- Generate a random number within a range
function utils.randomRange(min, max)
    return math.random(min, max)
end

-- Check if a value is in a table
function utils.contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Shuffle a table randomly
function utils.shuffle(table)
    local shuffled = {}
    for i = 1, #table do
        local randIndex = math.random(1, i)
        shuffled[i] = shuffled[randIndex]
        shuffled[randIndex] = table[i]
    end
    return shuffled
end

-- Deep copy a table
function utils.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[utils.deepcopy(orig_key)] = utils.deepcopy(orig_value)
        end
        setmetatable(copy, utils.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

return utils
