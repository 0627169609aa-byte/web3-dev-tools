-- Utility function to perform network operations with retry logic

local http = require('socket.http')

local function perform_network_operation(url, attempts, delay)
    local response, status
    attempts = attempts or 3  -- Default to 3 attempts
    delay = delay or 2        -- Default delay of 2 seconds

    for i = 1, attempts do
        response, status = http.request(url)
        if status == 200 then
            return response
        elseif i < attempts then
            print('Attempt ' .. i .. ' failed. Retrying in ' .. delay .. ' seconds...')
            os.execute('sleep ' .. delay)
        end
    end

    error('All attempts to fetch ' .. url .. ' failed.')
end

return {
    perform_network_operation = perform_network_operation
}