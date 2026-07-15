-- Utility function to perform network operations with retry logic

local http = require('http')

local function performRequest(url, options, retries, delay)
    local attempt = 0
    local response, err

    while attempt < retries do
        attempt = attempt + 1
        response, err = http.request(url, options)

        if response then
            return response
        end

        print(string.format('Attempt %d failed: %s', attempt, err))
        os.execute('sleep ' .. delay)
    end

    error(string.format('All %d attempts failed: %s', retries, err))
end

-- Public function to call for network requests
function makeNetworkRequest(url, options)
    local maxRetries = 3
    local retryDelay = 2  -- seconds

    return performRequest(url, options, maxRetries, retryDelay)
end

return { makeNetworkRequest = makeNetworkRequest }