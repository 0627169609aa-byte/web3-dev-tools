-- Utility functions for web3 gaming

---
-- Converts hex string to decimal number.
-- @param hexStr: Hexadecimal string to convert.
-- @return number: Decimal representation of the hex string.
---
local function hexToDecimal(hexStr)
    return tonumber(hexStr, 16)
end

---
-- Formats a balance in Wei to Ether.
-- @param weiBalance: Balance in Wei to format.
-- @return string: Formatted balance in Ether.
---
local function formatWeiToEther(weiBalance)
    local etherBalance = weiBalance / 1e18
    return string.format('%.18f ETH', etherBalance)
end

---
-- Checks if a given address is valid.
-- @param address: The Ethereum address to validate.
-- @return boolean: True if valid, false otherwise.
---
local function isValidEthereumAddress(address)
    return string.match(address, '^0x[a-fA-F0-9]{40}$') ~= nil
end

---
-- Retrieves the game state from a smart contract.
-- @param contract: The smart contract instance.
-- @return table: The game state information.
---
local function getGameState(contract)
    local state = contract:getState()
    return state
end

return {
    hexToDecimal = hexToDecimal,
    formatWeiToEther = formatWeiToEther,
    isValidEthereumAddress = isValidEthereumAddress,
    getGameState = getGameState,
}