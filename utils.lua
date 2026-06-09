-- Optimize performance for frequent game operations

local performanceUtil = {}

--- Measure execution time of a function
---@param func function: The function to measure
---@return number: Time taken in seconds
function performanceUtil.measureExecutionTime(func)
    local startTime = os.clock()
    func()
    local endTime = os.clock()
    return endTime - startTime
end

--- Efficiently process large data arrays
---@param data table: Input array of data
---@param processFunc function: Function to process each element
---@return table: New array with processed data
function performanceUtil.processLargeArray(data, processFunc)
    local result = {}
    -- Preserve memory and optimize processing with pre-allocation
    for i = 1, #data do
        result[i] = processFunc(data[i])
    end
    return result
end

--- Reduce overhead by caching results
---@param func function: Function to cache
---@return function: Cached version of the function
function performanceUtil.cacheFunctionResults(func)
    local cache = {}
    return function(arg)
        if not cache[arg] then
            cache[arg] = func(arg)
        end
        return cache[arg]
    end
end

return performanceUtil
