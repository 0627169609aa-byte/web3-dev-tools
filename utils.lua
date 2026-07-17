-- Logger setup with rotation for web3-dev-tools
local log = require('log')
local lfs = require('lfs')

local Logger = {}
Logger.__index = Logger

-- Initialize a new logger
function Logger:new(logfile, maxSize, maxBackups)
    local obj = setmetatable({}, Logger)
    obj.logfile = logfile or 'application.log'
    obj.maxSize = maxSize or 5 * 1024 * 1024 -- 5MB
    obj.maxBackups = maxBackups or 5
    return obj
end

-- Check if the log file needs rotation
function Logger:rotateLogs()
    local fileAttr = lfs.attributes(self.logfile)
    if fileAttr and fileAttr.size >= self.maxSize then
        -- Rotate log files
        for i = self.maxBackups, 1, -1 do
            local oldName = self.logfile .. '.' .. i
            local newName = self.logfile .. '.' .. (i + 1)
            if lfs.attributes(oldName) then
                os.rename(oldName, newName)
            end
        end
        os.rename(self.logfile, self.logfile .. '.1')
    end
end

-- Log a message
function Logger:log(message)
    self:rotateLogs()
    local file = io.open(self.logfile, 'a')
    file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
    file:close()
end

return Logger
