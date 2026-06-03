--[[
    Utility functions for web3 gaming tools.
    This module provides helper functions for various common tasks.
]]

---

---
--@param str string: The input string to capitalize.
--@return string: The capitalized string.
function capitalize(str)
    return str:sub(1, 1):upper() .. str:sub(2)
end

---
--@param table1 table: The first table to merge.
--@param table2 table: The second table to merge.
--@return table: A new table combining table1 and table2.
function mergeTables(table1, table2)
    local mergedTable = {}
    for k, v in pairs(table1) do
        mergedTable[k] = v
    end
    for k, v in pairs(table2) do
        mergedTable[k] = v
    end
    return mergedTable
end

---
--@param list table: A table containing items.
--@return table: A new table with the items shuffled.
function shuffleList(list)
    local shuffledList = {}
    for i = #list, 1, -1 do
        local randIndex = math.random(1, i)
        list[i], list[randIndex] = list[randIndex], list[i]
    end
    return list
end

---
--@param value any: The value to verify.
--@return boolean: True if value is a number, false otherwise.
function isNumber(value)
    return type(value) == 'number'
end
