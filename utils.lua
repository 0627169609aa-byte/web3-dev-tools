-- Retry logic for network operations

local http = require('socket.http')
local ltn12 = require('ltn12')

local function retryNetworkRequest(url, maxRetries, delay)
    local attempts = 0
    local response
    local err

    while attempts < maxRetries do
        attempts = attempts + 1
        response, err = http.request(url)

        if response then
            return response
        end
        
        print(string.format('Attempt %d failed: %s. Retrying in %d seconds...', attempts, err, delay))
        os.execute('sleep ' .. delay)
    end

    return nil, string.format('Failed after %d attempts. Last error: %s', attempts, err)
end

return {
    retryNetworkRequest = retryNetworkRequest
}
