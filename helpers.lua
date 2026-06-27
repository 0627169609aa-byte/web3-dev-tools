-- log rotation handler
local lfs = require('lfs')
local logger = {}

-- configuration
logger.log_file = 'application.log'
logger.max_size = 1048576 -- 1 MB
logger.backup_count = 5

function logger:log(message)
    local file = io.open(self.log_file, 'a')
    if not file then return end
    file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
    file:close()
    self:check_rotation()
end

function logger:check_rotation()
    local file_size = lfs.attributes(self.log_file, 'size')
    if file_size and file_size >= self.max_size then
        self:rotate_logs()
    end
end

function logger:rotate_logs()
    for i = self.backup_count, 1, -1 do
        local old_file = self.log_file .. '.' .. i
        local new_file = self.log_file .. '.' .. (i + 1)
        if lfs.attributes(old_file) then
            os.rename(old_file, new_file)
        end
    end
    os.rename(self.log_file, self.log_file .. '.1')
end

return logger