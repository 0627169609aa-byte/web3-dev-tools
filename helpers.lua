-- Utility functions for web3 gaming tools

local helpers = {}

-- Convert a hexadecimal string to a decimal
function helpers.hexToDecimal(hex)
    return tonumber(hex, 16)
end

-- Generate a random number within a specified range
function helpers.randomInRange(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

-- Check if a value is in a table
function helpers.valueInTable(value, tbl)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

-- Format a timestamp into a readable string
function helpers.formatTimestamp(timestamp)
    local date = os.date("%Y-%m-%d %H:%M:%S", timestamp)
    return date
end

-- Merge two tables
function helpers.mergeTables(tbl1, tbl2)
    for k, v in pairs(tbl2) do
        tbl1[k] = v
    end
    return tbl1
end

return helpers