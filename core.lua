-- Utility function to handle gaming data

local json = require('json')

--- Converts raw gaming data into a structured format
--
-- @param rawData: A string containing raw gaming data in JSON format
-- @return: A table representing structured gaming data
function parseGamingData(rawData)
    local data, pos, err = json.decode(rawData)
    if not data then
        error("Failed to parse gaming data: " .. err)
    end
    return data
end

--- Calculates the total score from a list of scores
--
-- @param scores: A table containing numerical scores
-- @return: The total score as a number
function calculateTotalScore(scores)
    local total = 0
    for _, score in ipairs(scores) do
        if type(score) == 'number' then
            total = total + score
        end
    end
    return total
end

--- Fetches and parses gaming data from a URL
--
-- @param url: The URL to fetch gaming data from
-- @return: A table representing structured gaming data
function fetchAndParseGamingData(url)
    local response = http.request(url)
    if response.code ~= 200 then
        error("Failed to fetch data: " .. response.code)
    end
    return parseGamingData(response.body)
end

return {
    parseGamingData = parseGamingData,
    calculateTotalScore = calculateTotalScore,
    fetchAndParseGamingData = fetchAndParseGamingData
}
