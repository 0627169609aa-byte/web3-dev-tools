-- Utility functions for gaming data handling

local M = {}

--- Convert game data from raw format to structured format
-- @param rawData table: Raw game data to be structured
-- @return table: Structured game data
function M.convertGameData(rawData)
    local structuredData = {}

    for _, entry in ipairs(rawData) do
        local gameEntry = {
            id = entry.id,
            name = entry.name,
            genre = entry.genre,
            releaseDate = os.time({
                year = entry.releaseYear,
                month = entry.releaseMonth,
                day = entry.releaseDay
            }),
            rating = tonumber(entry.rating)
        }
        table.insert(structuredData, gameEntry)
    end
    return structuredData
end

--- Calculate average rating from game entries
-- @param games table: List of game entries
-- @return number: Average rating of the games
function M.calculateAverageRating(games)
    local totalRating = 0
    local count = 0

    for _, game in ipairs(games) do
        if game.rating then
            totalRating = totalRating + game.rating
            count = count + 1
        end
    end

    if count > 0 then
        return totalRating / count
    else
        return 0  -- Prevent division by zero
    end
end

return M