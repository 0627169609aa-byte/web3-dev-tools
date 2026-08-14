-- Function to perform a network operation with retry logic
local function performNetworkOperation(url, retries, delay)
    local attempt = 0
    while attempt < retries do
        local success, response = pcall(function()
            -- Simulating a network call
            return http.request(url)
        end)

        if success then
            return response
        else
            attempt = attempt + 1
            print(string.format("Attempt %d failed: %s", attempt, response))
            os.execute("sleep " .. delay)  -- Wait before next attempt
        end
    end
    error("Network operation failed after " .. retries .. " attempts.")
end

-- Example usage
local url = "http://example.com/api"
local retries = 3
local delay = 2
local response = performNetworkOperation(url, retries, delay)
print("Final response: ", response)