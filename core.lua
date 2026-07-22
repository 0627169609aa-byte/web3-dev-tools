-- Retry logic for network operations

local http = require('socket.http')
local ltn12 = require('ltn12')

local function fetch_with_retry(url, max_retries, delay)
    local attempts = 0
    local success, response
    
    while attempts < max_retries do
        attempts = attempts + 1
        success, response = http.request(url)
        
        if success then
            return response
        else
            print('Attempt ' .. attempts .. ' failed, retrying in ' .. delay .. ' seconds...')
            os.sleep(delay)
        end
    end
    
    error('Failed to fetch data from ' .. url .. ' after ' .. max_retries .. ' attempts')
end

-- Example usage
local url = 'http://example.com/data'
local max_retries = 5
local delay = 2

local result = fetch_with_retry(url, max_retries, delay)
print('Fetched result: ' .. result)
