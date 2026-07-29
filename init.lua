-- Utility function to perform network operations with retry logic
local function performNetworkOperation(url, retries)
    local attempts = 0
    while attempts < retries do
        attempts = attempts + 1
        local response, err = http.request(url)
        if response then
            return response
        else
            print("Attempt " .. attempts .. " failed: " .. err)
            if attempts < retries then
                print("Retrying...")
                os.execute("sleep 1") -- Wait 1 second before retry
            end
        end
    end
    error("All attempts failed after " .. retries .. " retries.")
end

-- Example usage of the function
local function main()
    local url = "https://example.com/api/data"
    local maxRetries = 3
    local success, result = pcall(performNetworkOperation, url, maxRetries)
    if success then
        print("Data received: " .. result)
    else
        print("Error: " .. result)
    end
end

main()