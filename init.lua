-- Utility function to perform network operations with retry logic

local http = require('socket.http')
local ltn12 = require('ltn12')

local function perform_request(url, max_retries) 
    local retries = 0
    local response_body = {}

    while retries < max_retries do
        local result, status_code = http.request({
            url = url,
            sink = ltn12.sink.table(response_body)
        })

        if status_code == 200 then
            return table.concat(response_body)
        else
            print(string.format("Request failed with status: %d. Retrying...", status_code))
            retries = retries + 1
        end
    end

    error(string.format("Failed to perform request after %d attempts", max_retries))
end

local function main() 
    local url = "https://api.example.com/data"
    local max_retries = 5

    local success, result = pcall(perform_request, url, max_retries)
    if success then
        print("Response received:", result)
    else
        print("Error occurred:", result)
    end
end

main()
