-- Logger setup with rotation

local log = require('log')
local path = require('path')
local lfs = require 'lfs'

local Logger = {}
Logger.__index = Logger

function Logger:new(logfile, maxSize, maxFiles)
    local obj = setmetatable({}, Logger)
    obj.logfile = logfile
    obj.maxSize = maxSize or 1024 * 1024 -- 1 MB default
    obj.maxFiles = maxFiles or 5
    obj.currentSize = 0
    return obj
end

function Logger:rotate()
    if lfs.attributes(self.logfile, 'size') > self.maxSize then
        for i = self.maxFiles, 2, -1 do
            local oldName = self.logfile .. '.' .. (i - 1)
            local newName = self.logfile .. '.' .. i
            if lfs.attributes(oldName) then
                os.rename(oldName, newName)
            end
        end
        os.rename(self.logfile, self.logfile .. '.1')
    end
end

function Logger:log(message)
    self:rotate()
    local file = io.open(self.logfile, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    end
end

return Logger