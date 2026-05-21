-- Retry logic for network operations

local http = require('http')

-- Function to perform a network operation with retry logic
local function performNetworkOperation(url, maxRetries, delay)
    local attempts = 0
    local success, response

    while attempts < maxRetries do
        attempts = attempts + 1
        success, response = pcall(function() return http.get(url) end)

        if success and response.statusCode == 200 then
            return response.body
        elseif not success then
            print('Network error: ' .. response)
        else
            print('Attempt ' .. attempts .. ' failed with status: ' .. response.statusCode)
        end

        -- Wait before the next attempt
        os.execute('sleep ' .. delay)
    end

    error('Failed to reach URL after ' .. maxRetries .. ' attempts')
end

return { performNetworkOperation = performNetworkOperation }