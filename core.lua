-- Function to perform a network operation with retry logic
local function performNetworkOperation(url, maxRetries)
    local attempts = 0
    local success, response

    while attempts < maxRetries do
        success, response = pcall(function()
            return http.get(url) -- Replace with appropriate network call
        end)

        if success and response then
            return response
        else
            attempts = attempts + 1
            print("Attempt " .. attempts .. " failed. Retrying...")
            os.execute("sleep 1") -- wait before retrying
        end
    end

    error("Failed to perform network operation after " .. maxRetries .. " attempts.")
end

-- Example usage
local url = "https://api.gamingplatform.com/data"
local maxRetries = 5
local data

local status, err = pcall(function()
    data = performNetworkOperation(url, maxRetries)
end)

if not status then
    print("Error: " .. err)
else
    print("Data retrieved successfully:", data)
end
