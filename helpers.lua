-- Helper functions for common operations

local helpers = {}

-- Function to generate a random number within a range
function helpers.random(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

-- Function to convert a hexadecimal string to a decimal number
function helpers.hexToDecimal(hex)
    return tonumber(hex, 16)
end

-- Function to convert a decimal number to a hexadecimal string
function helpers.decimalToHex(decimal)
    return string.format("%X", decimal)
end

-- Function to check if a table contains a specific value
function helpers.tableContains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Function to merge two tables
function helpers.mergeTables(table1, table2)
    for k, v in pairs(table2) do
        table1[k] = v
    end
    return table1
end

return helpers
