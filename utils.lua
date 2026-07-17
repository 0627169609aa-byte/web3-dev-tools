-- Utility functions for network operations

local http = require('socket.http')
local ltn12 = require('ltn12')

local function retryNetworkOperation(operation, retries, delay)
    local attempts = 0
    local success, result

    while attempts < retries do
        success, result = pcall(operation)
        if success then
            return result
        end
        attempts = attempts + 1
        print('Retrying... Attempt ' .. attempts)
        os.execute('sleep ' .. delay)
    end

    error('Max retries reached')
end

local function fetchData(url)
    local response_body = {}
    local res, code, response_headers, status = http.request{
        url = url,
        sink = ltn12.sink.table(response_body)
    }
    if code ~= 200 then
        error('HTTP request failed with code ' .. tostring(code))
    end
    return table.concat(response_body)
end

return {
    retryNetworkOperation = retryNetworkOperation,
    fetchData = fetchData
}
