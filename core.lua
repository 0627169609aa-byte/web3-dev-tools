-- Logger setup with rotation

local log = require('log')
local lfs = require('lfs')

local Logger = {}
Logger.__index = Logger

function Logger:new(logFilePath, maxSize, backupCount)
    local instance = setmetatable({}, Logger)
    instance.logFilePath = logFilePath
    instance.maxSize = maxSize or 1024 * 1024 -- 1 MB default
    instance.backupCount = backupCount or 5
    return instance
end

function Logger:rotateLogs()
    local file = io.open(self.logFilePath, 'r')
    if file then
        local size = file:seek('end')
        file:close()

        if size >= self.maxSize then
            for i = self.backupCount, 1, -1 do
                local oldFile = string.format('%s.%d', self.logFilePath, i)
                local newFile = string.format('%s.%d', self.logFilePath, i + 1)
                if lfs.attributes(oldFile) then
                    os.rename(oldFile, newFile)
                end
            end
            os.rename(self.logFilePath, string.format('%s.1', self.logFilePath))
        end
    end
end

function Logger:log(message)
    self:rotateLogs()
    local file = io.open(self.logFilePath, 'a')
    file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
    file:close()
end

return Logger
