-- Logger Setup with Rotation

local socket = require('socket')
local lfs = require('lfs')

local Logger = {}
Logger.__index = Logger

function Logger:new(logFile, maxSize, backupCount)
    local logger = setmetatable({}, self)
    logger.logFile = logFile or 'app.log'
    logger.maxSize = maxSize or 10 * 1024 * 1024  -- 10 MB
    logger.backupCount = backupCount or 5
    return logger
end

function Logger:log(message)
    local file = io.open(self.logFile, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
        self:checkRotation()
    end
end

function Logger:checkRotation()
    local fileAttr = lfs.attributes(self.logFile)
    if fileAttr and fileAttr.size >= self.maxSize then
        self:rotateLogs()
    end
end

function Logger:rotateLogs()
    for i = self.backupCount, 1, -1 do
        local oldFile = self.logFile .. '.' .. i
        local newFile = self.logFile .. '.' .. (i + 1)
        if lfs.attributes(oldFile) then
            os.rename(oldFile, newFile)
        end
    end
    os.rename(self.logFile, self.logFile .. '.1')
end

return Logger