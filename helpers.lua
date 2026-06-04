--[[
    Helper functions for web3 gaming utilities.
    @module helpers
]]

local helpers = {}

--- 
-- Calculates the distance between two points in a 2D space.
-- @param x1 number: x-coordinate of the first point
-- @param y1 number: y-coordinate of the first point
-- @param x2 number: x-coordinate of the second point
-- @param y2 number: y-coordinate of the second point
-- @return number: The distance between the two points
function helpers.calculateDistance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

--- 
-- Generates a random integer within a given range.
-- @param low number: The lower bound of the random integer
-- @param high number: The upper bound of the random integer
-- @return number: A random integer between low and high
function helpers.randomInt(low, high)
    return math.random(low, high)
end

--- 
-- Converts a hexadecimal color value to an RGB table.
-- @param hex string: A hexadecimal color string (e.g. "#FF5733")
-- @return table: A table containing the R, G, B values
function helpers.hexToRGB(hex)
    hex = hex:gsub('#', '')
    return {
        r = tonumber('0x' .. hex:sub(1, 2)),
        g = tonumber('0x' .. hex:sub(3, 4)),
        b = tonumber('0x' .. hex:sub(5, 6))
    }
end

return helpers