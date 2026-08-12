-- Utility functions for web3 gaming

local M = {}

-- Safe division function that handles division by zero
function M.safeDivide(num, denom)
    if denom == 0 then
        error("Division by zero error")
    else
        return num / denom
    end
end

-- Function to validate player input
function M.validateInput(input)
    if type(input) ~= "string" or #input == 0 then
        error("Invalid input: must be a non-empty string")
    end
    return true
end

-- Function to fetch data with error handling
function M.fetchDataWithRetry(url, retries)
    local attempt = 0
    while attempt < retries do
        local success, result = pcall(function()
            -- Simulated fetching operation
            local response = http.get(url)
            if not response then
                error("Failed to fetch data")
            end
            return response.body
        end)
        if success then
            return result
        else
            attempt = attempt + 1
            print("Error fetching data: " .. result .. ". Retrying... (", attempt, "/", retries, ")")
        end
    end
    error("Failed to fetch data after " .. retries .. " attempts")
end

return M
