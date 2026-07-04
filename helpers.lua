local function delay(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do
        -- wait
    end
end

local function retry(func, retries, delaySeconds)
    local attempt = 0
    while attempt < retries do
        local status, result = pcall(func)
        if status then
            return result
        else
            attempt = attempt + 1
            if attempt < retries then
                delay(delaySeconds)
            end
        end
    end
    error('Maximum retries reached')
end

-- Example usage
local function fetchData()
    -- Simulated network operation
    if math.random() < 0.7 then
        error('Network error')
    end
    return 'Data retrieved successfully'
end

return {
    retry = retry,
    fetchData = fetchData
}
