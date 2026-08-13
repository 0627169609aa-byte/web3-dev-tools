-- Utility functions for network operations

local json = require('cjson')
local http = require('socket.http')
local ltn12 = require('ltn12')

local function handle_http_request(url, max_retries)
    local response_body = {}
    local attempts = 0
    local success = false
    
    while attempts < max_retries and not success do
        attempts = attempts + 1
        local result, status_code = http.request({
            url = url,
            sink = ltn12.sink.table(response_body)
        })
        
        if status_code == 200 then
            success = true
            return table.concat(response_body)
        else
            print('Attempt ' .. attempts .. ' failed with status: ' .. status_code)
        end
    end
    
    error('Failed to fetch data after ' .. attempts .. ' attempts')
end

local function fetch_data(url)
    local max_retries = 3
    local success, result = pcall(handle_http_request, url, max_retries)
    if success then
        return json.decode(result)
    else
        error('Network operation failed: ' .. result)
    end
end

return {
    fetch_data = fetch_data
}