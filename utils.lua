-- Utility functions for network operations

local http = require("socket.http")
local ltn12 = require("ltn12")

local function retryNetworkOperation(operation, maxRetries, delay)
    maxRetries = maxRetries or 3  -- set default max retries to 3
    delay = delay or 1000  -- set default delay to 1000 ms
    local attempt = 0
    local success, result

    repeat
        attempt = attempt + 1
        success, result = pcall(operation)  -- safely call the operation
        if not success then
            print(string.format("Attempt %d failed: %s", attempt, result))
            if attempt < maxRetries then
                os.execute(string.format("sleep %d", delay / 1000))  -- wait before retry
            end
        end
    until success or attempt >= maxRetries

    if not success then
        error(string.format("Operation failed after %d attempts", maxRetries))
    end
    return result
end

local function fetchUrl(url)
    local response_body = {}
    local res, code = http.request{
        url = url,
        sink = ltn12.sink.table(response_body)
    }

    if code ~= 200 then
        error(string.format("HTTP request failed with code %d", code))
    end
    return table.concat(response_body)
end

-- Fetch URL with retry logic
local function fetchWithRetry(url)
    return retryNetworkOperation(function()
        return fetchUrl(url)
    end, 5, 2000)  -- 5 retries, 2000 ms delay
end

return {
    fetchWithRetry = fetchWithRetry
}