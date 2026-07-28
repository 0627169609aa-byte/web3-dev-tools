-- Utility functions for gaming

-- Function to check if a number is even
local function isEven(num)
    return num % 2 == 0
end

-- Function to generate a random item based on weights
local function weightedRandom(items)
    local totalWeight = 0
    for _, item in ipairs(items) do
        totalWeight = totalWeight + item.weight
    end
    local randomValue = math.random() * totalWeight
    local cumulativeWeight = 0
    for _, item in ipairs(items) do
        cumulativeWeight = cumulativeWeight + item.weight
        if randomValue <= cumulativeWeight then
            return item
        end
    end
end

-- Function to calculate distance between two points
local function calculateDistance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

return {
    isEven = isEven,
    weightedRandom = weightedRandom,
    calculateDistance = calculateDistance,
}