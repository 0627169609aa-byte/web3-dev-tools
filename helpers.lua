-- Logger module with rotation setup

local Logger = {}
local logFilePath = 'app.log'
local maxFileSize = 1024 * 1024 * 5 -- 5 MB

local function getFileSize(filePath)
    local file = io.open(filePath, 'r')
    if file then
        local size = file:seek('end')
        file:close()
        return size
    end
    return 0
end

local function rotateLogFile()
    if getFileSize(logFilePath) >= maxFileSize then
        local rotatedFilePath = logFilePath .. '.' .. os.time()
        os.rename(logFilePath, rotatedFilePath)
    end
end

function Logger.log(message)
    rotateLogFile()
    local file = io.open(logFilePath, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    else
        error('Could not open log file for writing.')
    end
end

return Logger
