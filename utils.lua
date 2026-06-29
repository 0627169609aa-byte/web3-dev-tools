-- Helper Functions for Common Operations

---
-- Convert a hexadecimal string to a number
-- @param hexStr: String representing the hexadecimal number
-- @return: Number representation of the hexadecimal
---
local function hexToNumber(hexStr)
    return tonumber(hexStr, 16)
end

---
-- Convert a number to a hexadecimal string
-- @param num: Number to convert to hexadecimal
-- @return: String representation of the hexadecimal
---
local function numberToHex(num)
    return string.format("%x", num)
end

---
-- Generate a random hex string of specified length
-- @param length: Desired length of the hex string
-- @return: Random hexadecimal string
---
local function randomHex(length)
    local chars = '0123456789abcdef'
    local result = ''
    for i = 1, length do
        local index = math.random(1, #chars)
        result = result .. chars:sub(index, index)
    end
    return result
end

---
-- Check if a given value is a valid Ethereum address
-- @param address: String input to validate
-- @return: Boolean indicating if valid
---
local function isValidEthereumAddress(address)
    return string.match(address, '^0x[a-fA-F0-9]{40}$') ~= nil
end

return {
    hexToNumber = hexToNumber,
    numberToHex = numberToHex,
    randomHex = randomHex,
    isValidEthereumAddress = isValidEthereumAddress
}