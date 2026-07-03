-- Utility functions for web3 gaming

local M = {}

-- Function to handle errors gracefully
local function handleError(err)
    if type(err) == 'string' then
        print('Error: ' .. err)
    elseif type(err) == 'table' and err.message then
        print('Error: ' .. err.message)
    else
        print('An unexpected error occurred.')
    end
end

-- Function to fetch game data with error handling
function M.fetchGameData(apiUrl)
    local success, result = pcall(function()
        local response = http.get(apiUrl)
        if not response then
            error('Failed to fetch data from API.')
        end
        return response:readAll()
    end)

    if not success then
        handleError(result)
        return nil
    end

    return result
end

-- Function to convert JSON to table while handling errors
function M.parseJSON(jsonString)
    local success, data = pcall(function()
        return json.decode(jsonString)
    end)

    if not success then
        handleError(data)
        return nil
    end

    return data
end

return M
