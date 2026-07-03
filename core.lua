-- Utility function for network operations

local function http_request(url)
    -- Simulate an HTTP request (replace with actual request)
    local response, err = simulate_http_request(url)  
    return response, err
end

-- Retry logic implementation
local function retry_request(url, retries, delay)
    local attempts = 0
    local response, err

    while attempts < retries do
        response, err = http_request(url)
        if response then
            return response  -- Successful request, return response
        end
        attempts = attempts + 1
        -- Wait before the next attempt
        os.execute("sleep " .. delay)
    end
    return nil, err  -- Return nil if all attempts fail
end

-- Example usage
local function fetch_data()
    local url = "https://api.example.com/data"
    local max_retries = 5
    local wait_time = 2  -- seconds

    local data, err = retry_request(url, max_retries, wait_time)
    if not data then
        print("Failed to fetch data:", err)
    else
        print("Data fetched successfully:", data)
    end
end

fetch_data()
