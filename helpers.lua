-- Input validation for web3 transaction data

local function isValidAddress(address)
    if type(address) ~= 'string' then return false end
    -- Simple regex for Ethereum addresses
    return address:match('^0x[a-fA-F0-9]{40}$') ~= nil
end

local function isValidAmount(amount)
    return type(amount) == 'number' and amount > 0
end

local function validateTransactionInput(transaction)
    if not isValidAddress(transaction.from) then
        return false, 'Invalid sender address'
    end
    if not isValidAddress(transaction.to) then
        return false, 'Invalid receiver address'
    end
    if not isValidAmount(transaction.value) then
        return false, 'Invalid transaction amount'
    end
    return true
end

local function processTransaction(transaction)
    local isValid, errMsg = validateTransactionInput(transaction)
    if not isValid then
        error(errMsg)
    end
    -- Proceed with transaction processing logic here...
end

return {
    validateTransactionInput = validateTransactionInput,
    processTransaction = processTransaction
}
