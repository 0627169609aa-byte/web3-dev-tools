-- Utility functions for web3 gaming

local utils = {}

-- Check if a table is empty
function utils.isEmpty(table)
    return next(table) == nil
end

-- Deep copy a table
function utils.deepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[utils.deepCopy(orig_key)] = utils.deepCopy(orig_value)
        end
        setmetatable(copy, utils.deepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Generate a unique identifier
function utils.generateUniqueId()
    return tostring(math.random()):sub(3)..os.time() -- random + timestamp
end

-- Format a number to currency
function utils.formatCurrency(amount)
    return string.format('$%.2f', amount)
end

return utils
