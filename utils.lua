-- Utility functions for game management

local utils = {}

-- Generates a random number between min and max
function utils.random(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

-- Checks if a table contains a value
function utils.contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Shuffles a table randomly
function utils.shuffle(t)
    local shuffled = {}
    for i = 1, #t do
        local randIndex = utils.random(1, i)
        shuffled[i] = shuffled[randIndex]
        shuffled[randIndex] = t[i]
    end
    return shuffled
end

-- Merges two tables into one
function utils.merge(t1, t2)
    for _, v in ipairs(t2) do
        table.insert(t1, v)
    end
    return t1
end

return utils
