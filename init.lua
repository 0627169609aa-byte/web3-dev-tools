-- Logger module for rotating logs

local log = require('log')
local lfs = require('lfs')

local Logger = {}
Logger.__index = Logger

-- Logger constructor
function Logger:new(logFilePath, maxLogSize, maxLogFiles)
    local logger = setmetatable({}, Logger)
    logger.logFilePath = logFilePath or 'app.log'
    logger.maxLogSize = maxLogSize or 10 * 1024 * 1024  -- 10 MB
    logger.maxLogFiles = maxLogFiles or 5
    logger:fileCleanup()  -- Clean up old log files
    return logger
end

-- Function to log a message
function Logger:log(message)
    local file = io.open(self.logFilePath, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    end
    self:rotateLogs()
end

-- Function to rotate logs
function Logger:rotateLogs()
    local fileAttr = lfs.attributes(self.logFilePath)
    if fileAttr and fileAttr.size >= self.maxLogSize then
        local oldFile = self.logFilePath .. '.' .. os.date('%Y%m%d_%H%M%S')
        os.rename(self.logFilePath, oldFile)
        self:fileCleanup()
    end
end

-- Function to clean up old log files
function Logger:fileCleanup()
    local count = 0
    for file in lfs.dir('.') do
        if file:match('^' .. self.logFilePath .. '%.%d+') then
            count = count + 1
            if count > self.maxLogFiles then
                os.remove(file)
            end
        end
    end
end

return Logger
