-- Utility function to perform a network request with retry logic

local http = require('socket.http')

local function performRequest(url, retries, delay)
    local attempts = 0
    while attempts < retries do
        local response, status = http.request(url)
        if status == 200 then
            return response
        else
            attempts = attempts + 1
            print('Attempt ' .. attempts .. ' failed: ' .. status .. '. Retrying in ' .. delay .. ' seconds...')
            os.execute('sleep ' .. delay)
        end
    end
    error('Failed to perform request after ' .. attempts .. ' attempts.')
end

return {
    performRequest = performRequest
}