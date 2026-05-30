-- Optimized function to calculate hash for game data

local function calculateHash(data)
    local hash = 5381
    for i = 1, #data do
        hash = ((hash * 33) ~ b[i]) % 0xFFFFFFFF
    end
    return hash
end

-- Optimized function to combine tables
local function mergeTables(t1, t2)
    local result = {}
    for k, v in pairs(t1) do
        result[k] = v
    end
    for k, v in pairs(t2) do
        if result[k] == nil then
            result[k] = v
        end
    end
    return result
end

-- Caching previously calculated hashes to improve performance
local hashCache = {}
function getCachedHash(data)
    local key = table.concat(data, ",")
    if hashCache[key] then
        return hashCache[key]
    else
        local newHash = calculateHash(data)
        hashCache[key] = newHash
        return newHash
    end
end

return {
    calculateHash = calculateHash,
    mergeTables = mergeTables,
    getCachedHash = getCachedHash,
}