local http = require('socket.http')

local MAX_RETRIES = 5
local RETRY_DELAY = 2 -- seconds

local function http_get_with_retries(url)
    local tries = 0
    local response, code, headers, status
    repeat
        response, code, headers, status = http.request(url)
        tries = tries + 1
        if not response then
            print('Attempt '..tries..' failed: '..(code or 'unknown error'))
            if tries < MAX_RETRIES then
                os.execute('sleep '..RETRY_DELAY)
            end
        end
    until response or tries >= MAX_RETRIES

    if not response then
        error('HTTP request failed after '..MAX_RETRIES..' attempts')
    end
    return response, code, headers, status
end

return {
    http_get_with_retries = http_get_with_retries,
}