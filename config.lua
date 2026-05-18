-- Logger configuration for web3-dev-tools

local lfs = require('lfs')

local Logger = {}  
Logger.__index = Logger

-- Initialize the logger with filename and rotation settings
function Logger:new(filename, maxSize)
    local obj = {}
    setmetatable(obj, self)
    self.filename = filename or 'app.log'
    self.maxSize = maxSize or 1048576  -- Default to 1 MB
    self.currentFileSize = 0
    return obj
end

-- Check the file size and rotate if necessary
function Logger:checkRotation()
    local file = io.open(self.filename, 'r')
    if file then
        file:seek('end')
        self.currentFileSize = file:tell()
        file:close()
    end
    if self.currentFileSize >= self.maxSize then
        self:rotate()
    end
end

-- Rotate the log file
function Logger:rotate()
    local oldFileName = self.filename .. '.' .. os.date('%Y%m%d%H%M%S')
    os.rename(self.filename, oldFileName)
    self.currentFileSize = 0
end

-- Log a message to the file
function Logger:log(message)
    self:checkRotation()
    local file = io.open(self.filename, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    end
end

return Logger
