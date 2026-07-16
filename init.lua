-- Function to perform a network request with retry logic
local http = require('socket.http')

local function fetchWithRetry(url, retries, delay)
    local attempts = 0
    local response, code

    while attempts < retries do
        response, code = http.request(url)
        if code == 200 then
            return response
        else
            attempts = attempts + 1
            print(string.format('Attempt %d failed. Retrying in %d seconds...\n', attempts, delay))
            os.execute('sleep ' .. delay)
        end
    end

    error('Failed to fetch data after ' .. retries .. ' retries')
end

-- Example usage
local url = 'https://api.example.com/data'
local data, err = fetchWithRetry(url, 5, 2)
if data then
    print('Data fetched successfully!')
else
    print('Error fetching data: ' .. err)
end

return { fetchWithRetry = fetchWithRetry }