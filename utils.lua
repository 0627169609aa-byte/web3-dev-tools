-- Utility functions for web3 gaming

local function isValidAddress(address)
    return type(address) == 'string' and address:match('^0x[a-fA-F0-9]{40}$')
end

local function handleError(errMsg)
    print('Error: ' .. errMsg)
    return { success = false, message = errMsg }
end

local function processTransaction(address, amount)
    if not isValidAddress(address) then
        return handleError('Invalid Ethereum address provided.')
    end
    if type(amount) ~= 'number' or amount <= 0 then
        return handleError('Amount must be a positive number.')
    end
    -- Simulated transaction processing
    print('Processing transaction...')
    return { success = true, message = 'Transaction successful.', address = address, amount = amount }
end

return {
    isValidAddress = isValidAddress,
    handleError = handleError,
    processTransaction = processTransaction,
}