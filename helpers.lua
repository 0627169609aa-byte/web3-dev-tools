-- Logger module for handling log rotation

local logger = {}
local lfs = require('lfs')

-- Log file parameters
local logFilePath = 'app.log'
local maxLogSize = 1024 * 1024 * 5 -- 5MB
local logBackupCount = 5

-- Function to check log size and rotate logs
local function checkLogRotation()
    local file = io.open(logFilePath, 'a')
    if not file then return end

    local currentSize = file:seek('end')
    file:close()

    if currentSize < maxLogSize then return end

    -- Rotate logs
    for i = logBackupCount, 1, -1 do
        local oldName = logFilePath .. '.' .. i
        local newName = logFilePath .. '.' .. (i + 1)
        if lfs.attributes(oldName) then
            os.rename(oldName, newName)
        end
    end
    os.rename(logFilePath, logFilePath .. '.1')
end

-- Function to log messages
function logger.log(message)
    checkLogRotation()
    local file = io.open(logFilePath, 'a')
    if file then
        local timestamp = os.date('%Y-%m-%d %H:%M:%S')
        file:write(string.format('%s: %s\n', timestamp, message))
        file:close()
    end
end

return logger
