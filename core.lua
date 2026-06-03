-- Logger setup with rotation in Lua

local lfs = require('lfs')

local Logger = {}
Logger.__index = Logger

function Logger:new(log_dir, max_size, rotation_count)
    local obj = setmetatable({}, self)
    obj.log_dir = log_dir
    obj.max_size = max_size or 1024 * 1024 -- Default 1 MB
    obj.rotation_count = rotation_count or 5
    obj.current_log = log_dir .. '/app.log'
    return obj
end

function Logger:log(message)
    local log_file = io.open(self.current_log, 'a')
    if log_file then
        log_file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        log_file:close()
        self:check_rotation()
    end
end

function Logger:check_rotation()
    local file_size = lfs.attributes(self.current_log, 'size')
    if file_size and file_size >= self.max_size then
        self:rotate_logs()
    end
end

function Logger:rotate_logs()
    for i = self.rotation_count, 1, -1 do
        local old_log = self.log_dir .. '/app.log.' .. i
        local new_log = self.log_dir .. '/app.log.' .. (i + 1)
        if lfs.attributes(old_log) then
            os.rename(old_log, new_log)
        end
    end
    os.rename(self.current_log, self.log_dir .. '/app.log.1')
end

return Logger
