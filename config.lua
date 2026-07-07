-- Logger setup with rotation using LuaFileSystem
local lfs = require 'lfs'

local Logger = {}
Logger.__index = Logger

function Logger.new(log_dir, max_size, rotation_count)
    local self = setmetatable({}, Logger)
    self.log_dir = log_dir or './logs'
    self.max_size = max_size or 1024 * 1024 -- 1 MB
    self.rotation_count = rotation_count or 5
    self:setup_log_directory()
    self.current_log_file = self:generate_log_filename()
    return self
end

function Logger:setup_log_directory()
    if not lfs.attributes(self.log_dir) then
        lfs.mkdir(self.log_dir)
    end
end

function Logger:generate_log_filename()
    return string.format('%s/log_%s.txt', self.log_dir, os.date('%Y%m%d_%H%M%S'))
end

function Logger:log(message)
    local file = io.open(self.current_log_file, 'a')
    file:write(string.format('[%s] %s\n', os.date('%Y-%m-%d %H:%M:%S'), message))
    file:close()
    self:check_rotation()
end

function Logger:check_rotation()
    local file_size = lfs.attributes(self.current_log_file, 'size')
    if file_size and file_size >= self.max_size then
        self:rotate_logs()
    end
end

function Logger:rotate_logs()
    for i = self.rotation_count, 1, -1 do
        local old_file = string.format('%s/log_%d.txt', self.log_dir, i - 1)
        local new_file = string.format('%s/log_%d.txt', self.log_dir, i)
        if lfs.attributes(old_file) then
            os.rename(old_file, new_file)
        end
    end
    os.rename(self.current_log_file, string.format('%s/log_0.txt', self.log_dir))
    self.current_log_file = self:generate_log_filename()
end

return Logger