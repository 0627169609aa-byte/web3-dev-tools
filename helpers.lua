-- Retry function for network operations
local function retry(fn, retries, delay)
    local attempts = 0
    while attempts < retries do
        local success, result = pcall(fn)
        if success then
            return result
        end
        attempts = attempts + 1
        if attempts < retries then
            os.execute("sleep " .. delay)
        end
    end
    error("Maximum retries reached")
end

-- Example of a network operation using retry logic
local function fetchData(url)
    -- Simulate a network request
    local response = httpRequest(url)  -- Assuming httpRequest is a defined function
    return response
end

local function httpRequest(url)
    -- Simulate possible failure
decision = math.random(1, 3)
    if decision == 1 then
        return "Data retrieved successfully from " .. url
    else
        error("Network error")
    end
end

-- Usage
local url = "https://api.example.com/data"
local result = retry(function() return fetchData(url) end, 3, 2)
print(result)