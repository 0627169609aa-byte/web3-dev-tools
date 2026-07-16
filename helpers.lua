-- Helper functions for web3 gaming

local Helpers = {}

--- Check if a table is empty
-- @param tbl Table to check
-- @return Boolean indicating emptiness
function Helpers.isEmpty(tbl)
    return next(tbl) == nil
end

--- Generate a random number within a range
-- @param min Minimum number
-- @param max Maximum number
-- @return Random number
function Helpers.random(min, max)
    math.randomseed(os.time())  -- Seed the random number generator
    return math.random(min, max)
end

--- Convert a hex string to a byte array
-- @param hex Hex string to convert
-- @return Byte array
function Helpers.hexToBytes(hex)
    local bytes = {}
    for i = 1, #hex, 2 do
        local byte = tonumber(hex:sub(i, i + 1), 16)
        table.insert(bytes, byte)
    end
    return bytes
end

--- Delay execution for a specified duration
-- @param seconds Duration to wait
function Helpers.delay(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do end
end

return Helpers