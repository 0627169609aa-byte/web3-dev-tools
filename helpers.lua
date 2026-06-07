--[[
Utility functions for making network requests with retry logic in Lua.
]]

local http = require('socket.http')
local ltn12 = require('ltn12')

local function retryRequest(url, maxRetries, delay)
    local attempts = 0
    local response = {}  

    while attempts < maxRetries do
        local res, code, headers, status = http.request({
            url = url,
            sink = ltn12.sink.table(response)
        })
        
        if code == 200 then
            return table.concat(response), code  -- Return response and status code
        else
            attempts = attempts + 1
            print(string.format('Attempt %d failed: %s. Retrying in %d seconds... ', attempts, status, delay))
            os.execute('sleep ' .. delay)  -- Sleep before retry
        end
    end
    
    return nil, 'Failed after ' .. maxRetries .. ' attempts'
end

return {
    retryRequest = retryRequest
}