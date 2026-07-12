-- Utility functions for web3 gaming

---
-- Checks if a given address is valid
-- @param address string: The Ethereum address to validate
-- @return boolean: True if valid, false otherwise
---
local function isValidAddress(address)
    return string.match(address, '^0x[a-fA-F0-9]{40}') ~= nil
end

---
-- Converts a hexadecimal value to decimal
-- @param hex string: The hexadecimal string to convert
-- @return number: The decimal representation of the hexadecimal value
---
local function hexToDecimal(hex)
    return tonumber(hex, 16)
end

---
-- Converts a decimal value to hexadecimal
-- @param decimal number: The decimal number to convert
-- @return string: The hexadecimal representation of the decimal value
---
local function decimalToHex(decimal)
    return string.format('0x%x', decimal)
end

---
-- Generates a random unique game ID
-- @return string: A unique game ID
---
local function generateGameID()
    local id = ''
    for i = 1, 10 do
        id = id .. string.char(math.random(48, 122))
    end
    return id
end

return {
    isValidAddress = isValidAddress,
    hexToDecimal = hexToDecimal,
    decimalToHex = decimalToHex,
    generateGameID = generateGameID
}
