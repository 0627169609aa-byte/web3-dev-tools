--[[
    This module contains helper functions 
    for various operations in the web3 gaming context.
    Functions include validation and formatting utilities.
--]]

local M = {}

--- Validates if a string is a valid Ethereum address.
-- @param address string - The Ethereum address to validate.
-- @return boolean - Returns true if valid, false otherwise.
function M.isValidEthereumAddress(address)
    return address:match('^0x[a-fA-F0-9]{40}$') ~= nil
end

--- Formats a number to a fixed decimal point based on currency.
-- @param amount number - The amount to format.
-- @param decimals integer - The number of decimal places.
-- @return string - The formatted number as a string.
function M.formatAmount(amount, decimals)
    if type(amount) ~= 'number' or type(decimals) ~= 'number' then
        error('Invalid arguments: amount and decimals must be numbers')
    end
    return string.format('%.2f', amount)
end

--- Checks if a given game ID is valid.
-- @param gameId string - The ID of the game.
-- @return boolean - Returns true if valid, false otherwise.
function M.isValidGameId(gameId)
    return gameId ~= nil and #gameId > 0
end

return M
