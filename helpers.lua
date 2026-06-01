-- Helper functions for web3 gaming operations

local helpers = {}

--- Convert a hex string to a decimal number
-- @param hexString: string
-- @return number
function helpers.hexToDec(hexString)
    return tonumber(hexString, 16)
end

--- Check if a given address is valid
-- @param address: string
-- @return boolean
function helpers.isValidAddress(address)
    return string.match(address, '^0x%x+$') ~= nil and #address == 42
end

--- Delay execution for a given amount of time
-- @param seconds: number
-- @return nil
function helpers.delay(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do end
end

--- Generate a random number within a range
-- @param min: number
-- @param max: number
-- @return number
function helpers.randomInRange(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

return helpers