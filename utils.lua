-- Utility functions for web3 gaming

---
-- Converts a hex string to a decimal number
-- @param hexStr: The hexadecimal string to convert
-- @return: The decimal number representation of the hex string
---
function hexToDecimal(hexStr)
    return tonumber(hexStr, 16)
end

---
-- Validates if a given address is a valid Ethereum address
-- @param address: The Ethereum address to validate
-- @return: True if valid, false otherwise
---
function isValidEthereumAddress(address)
    return string.match(address, '^0x[%x]+') ~= nil and #address == 42
end

---
-- Generates a random player ID
-- @return: A random string representing player ID
---
function generatePlayerId()
    local playerId = 'player_' .. tostring(math.random(100000, 999999))
    return playerId
end

---
-- Formats a game's token balance
-- @param balance: The balance amount in tokens
-- @return: A string formatted with the token symbol
---
function formatTokenBalance(balance)
    return string.format('%.4f Tokens', balance)
end

---
-- Converts a timestamp to a formatted date string
-- @param timestamp: The timestamp to format
-- @return: A formatted date string
---
function formatDate(timestamp)
    return os.date('%Y-%m-%d %H:%M:%S', timestamp)
end

return {
    hexToDecimal = hexToDecimal,
    isValidEthereumAddress = isValidEthereumAddress,
    generatePlayerId = generatePlayerId,
    formatTokenBalance = formatTokenBalance,
    formatDate = formatDate,
}