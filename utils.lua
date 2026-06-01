-- Utility functions for web3 network operations

local http = require("socket.http")
local ltn12 = require("ltn12")

--- Perform a network operation with retry logic
-- @param url The URL for the network request
-- @param max_retries Maximum number of retries
-- @param delay Delay in seconds between retries
-- @return Response body or nil on failure
local function perform_request(url, max_retries, delay)
    local response_body = {}
    local attempts = 0
    local success = false

    while attempts < max_retries do
        local res, code, response_headers, status = http.request({
            url = url,
            sink = ltn12.sink.table(response_body)
        })

        if code == 200 then
            success = true
            break
        else
            attempts = attempts + 1
            print(string.format("Attempt %d failed: %s. Retrying in %d seconds...", attempts, status, delay))
            os.execute("sleep " .. delay)
        end
    end

    if success then
        return table.concat(response_body)
    else
        print("All attempts failed.")
        return nil
    end
end

return {
    perform_request = perform_request
}