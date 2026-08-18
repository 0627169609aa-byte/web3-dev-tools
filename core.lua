-- Core functionalities for game transactions

local function safeExecute(func)
    local status, err = xpcall(func, debug.traceback)
    if not status then
        print("Error during execution: " .. err)
        return false
    end
    return true
end

local function validateTransaction(transaction)
    if not transaction.id or not transaction.amount then
        error("Invalid transaction: Missing id or amount.")
    end
    if transaction.amount <= 0 then
        error("Invalid transaction: Amount must be positive.")
    end
end

local function processTransaction(transaction)
    safeExecute(function()
        validateTransaction(transaction)
        -- Simulate processing
        print(string.format("Processing transaction %s for amount %.2f", transaction.id, transaction.amount))
    end)
end

local function main()
    local transactions = {
        {id = 1, amount = 100},
        {id = 2, amount = -50},  -- This will trigger an error
        {id = 3}                 -- This will trigger an error
    }

    for _, transaction in ipairs(transactions) do
        processTransaction(transaction)
    end
end

main()