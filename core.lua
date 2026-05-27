-- Core module for performance optimization

local function optimizeDataProcessing(data)
    local processed = {}
    for key, value in pairs(data) do
        -- Preallocation for known size improves performance
        processed[key] = value * 2
    end
    return processed
end

local function cacheRecentResults(cache, key, result)
    if #cache >= 100 then
        table.remove(cache, 1)  -- Maintain cache size
    end
    table.insert(cache, { key = key, result = result })
end

local function fetchFromCache(cache, key)
    for _, entry in ipairs(cache) do
        if entry.key == key then
            return entry.result
        end
    end
    return nil  -- Not found in cache
end

local function performCalculation(data)
    local cache = {}
    for _, value in ipairs(data) do
        local cachedResult = fetchFromCache(cache, value)
        if cachedResult then
            print('Fetched from cache:', cachedResult)
        else
            local result = optimizeDataProcessing({ value })[value]
            print('Computed result:', result)
            cacheRecentResults(cache, value, result)
        end
    end
end

return {
    performCalculation = performCalculation
}