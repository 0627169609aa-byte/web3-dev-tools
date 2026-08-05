-- Initialize web3-dev-tools

local function checkAddress(address)
    -- Check if the address is valid
    return string.match(address, '^0x[%x]+') ~= nil
end

local function formatTransaction(transaction)
    -- Format transaction into a standard table
    return {
        from = transaction.from or "",
        to = transaction.to or "",
        value = transaction.value or 0,
        gas = transaction.gas or 21000,
        data = transaction.data or ""
    }
end

local function generateRandomId(length)
    -- Generate a random string ID
    local id = ""
    for i = 1, length do
        id = id .. string.char(math.random(97, 122))
    end
    return id
end

local function logError(message)
    -- Basic error logging
    print(os.date('%Y-%m-%d %H:%M:%S') .. " ERROR: " .. message)
end

return {
    checkAddress = checkAddress,
    formatTransaction = formatTransaction,
    generateRandomId = generateRandomId,
    logError = logError
}
