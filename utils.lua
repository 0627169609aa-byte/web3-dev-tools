-- Utility functions for network operations

local http = require('socket.http')

local function is_success(status)
    return status == 200
end

local function retry_request(url, attempts, delay)
    local response
    local status
    attempts = attempts or 3  -- Default to 3 attempts
    delay = delay or 2        -- Default to 2 seconds delay

    for i = 1, attempts do
        response, status = http.request(url)
        if is_success(status) then
            return response
        else
            print(string.format('Attempt %d/%d failed. Status: %d. Retrying in %d seconds...', i, attempts, status, delay))
            os.execute('sleep ' .. delay)
        end
    end

    error('Failed to retrieve data after ' .. attempts .. ' attempts.')
end

-- Function to fetch game data from server
function fetch_game_data(api_url)
    return retry_request(api_url, 5, 3)  -- 5 attempts, 3 seconds delay
end

return {
    fetch_game_data = fetch_game_data,
}
