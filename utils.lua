-- Utility functions for web3 gaming

local utils = {}

-- Function to safely parse JSON
function utils.safeJsonParse(jsonString)
    local success, result = pcall(function() return game:GetService('HttpService'):JSONDecode(jsonString) end)
    if not success then
        error('Failed to parse JSON: ' .. tostring(result))
    end
    return result
end

-- Function to validate player input
function utils.validatePlayerInput(input)
    if input == nil or input == '' then
        error('Invalid input: Input cannot be nil or empty')
    end
    -- Add more validation rules as needed
    return true
end

-- Function to handle network requests with error handling
function utils.safeNetworkRequest(url)
    local success, response = pcall(function() return game:GetService('HttpService'):GetAsync(url) end)
    if not success then
        error('Network request failed: ' .. tostring(response))
    end
    return response
end

-- Function to check if a number is within a specified range
function utils.isNumberInRange(value, min, max)
    if type(value) ~= 'number' then
        error('Invalid value: Expected a number')
    end
    if value < min or value > max then
        error(string.format('Value out of range: %d is not in [%d, %d]', value, min, max))
    end
    return true
end

return utils
