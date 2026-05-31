-- Logger module with rotation functionality

local logger = {}
local logFile = 'app.log'
local maxFileSize = 1024 * 1024 * 5 -- 5 MB

-- Helper function to get file size
local function getFileSize(filename)
    local file = io.open(filename, 'r')
    if not file then return 0 end
    local size = file:seek('end')
    file:close()
    return size
end

-- Rotate log file if it exceeds max size
local function rotateLogFile()
    if getFileSize(logFile) >= maxFileSize then
        local timestamp = os.date('%Y%m%d%H%M%S')
        os.rename(logFile, logFile .. '.' .. timestamp)
    end
end

-- Logging function
function logger.log(message)
    rotateLogFile()
    local file = io.open(logFile, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    end
end

return logger
