-- Network operation retry logic

local http = require('socket.http')
local ltn12 = require('ltn12')

local MAX_RETRIES = 3
local WAIT_TIME = 2  -- seconds

local function retryOperation(operation, retries)
    local attempts = 0
    while attempts < retries do
        local success, result = pcall(operation)
        if success then
            return result
        end
        attempts = attempts + 1
        print(string.format('Attempt %d failed, retrying in %d seconds...', attempts, WAIT_TIME))
        os.execute(string.format('sleep %d', WAIT_TIME))
    end
    error('All attempts to perform the operation failed.')
end

local function fetchData(url)
    local response_body = {}
    local res, code, response_headers, status = http.request {
        url = url,
        sink = ltn12.sink.table(response_body),
    }
    if code ~= 200 then
        error('Failed to fetch data: ' .. tostring(code))
    end
    return table.concat(response_body)
end

local function getDataWithRetry(url)
    return retryOperation(function() return fetchData(url) end, MAX_RETRIES)
end

return {
    getDataWithRetry = getDataWithRetry,
}