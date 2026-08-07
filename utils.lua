-- Logger setup with rotation in Lua

local lfs = require 'lfs'
local os = require 'os'

local Logger = {}
Logger.__index = Logger

function Logger:new(log_file, max_size)
    local instance = setmetatable({}, self)
    instance.log_file = log_file
    instance.max_size = max_size or 1024 * 1024 -- Default to 1MB
    return instance
end

function Logger:log(message)
    local file = io.open(self.log_file, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
        self:check_rotation()
    else
        print('Failed to open log file')
    end
end

function Logger:check_rotation()
    local file = io.open(self.log_file, 'r')
    if file then
        file:seek('end')
        local size = file:tell()
        file:close()

        if size >= self.max_size then
            self:rotate() 
        end
    end
end

function Logger:rotate()
    local rotated_file = self.log_file .. '.' .. os.date('%Y%m%d%H%M%S')
    os.rename(self.log_file, rotated_file)
end

return Logger
