-- Utility functions for performance optimization

local M = {}

-- Cache storage for results to avoid redundant calculations
local cache = {}

-- Function to calculate expensive operation
-- Leverages caching for optimization
function M.expensiveOperation(x)
    if cache[x] then
        return cache[x]  -- Return cached result if available
    end
    
    -- Simulate an expensive calculation
    local result = x * x -- Example of an expensive operation

    -- Store result in cache
    cache[x] = result
    return result
end

-- Function to clear cache
function M.clearCache()
    cache = {}
end

-- Batch processing of operations with optimization
function M.batchProcess(values)
    local results = {}
    for _, value in ipairs(values) do
        table.insert(results, M.expensiveOperation(value))
    end
    return results
end

return M
