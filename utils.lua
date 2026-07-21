-- Utility function for handling gaming data

local json = require('json')

local function processGameData(gameData)
    local processedData = {}

    for _, data in ipairs(gameData) do
        local processedEntry = {}
        processedEntry.id = data.id
        processedEntry.name = data.name or 'Unnamed Game'
        processedEntry.genre = data.genre or 'Unknown'
        processedEntry.releaseDate = data.releaseDate or 'Not Available'
        processedEntry.rating = data.rating or 0

        -- Convert additional properties to a more readable format
        if data.additionalInfo then
            processedEntry.info = json.decode(data.additionalInfo)
        else
            processedEntry.info = {}
        end

        table.insert(processedData, processedEntry)
    end

    return processedData
end

return {
    processGameData = processGameData
}