-- Logger setup for rotation
local json = require('dkjson')
local lfs = require('lfs')

local Logger = {}
Logger.filepath = 'logs/app.log'
Logger.max_size = 1024 * 1024 * 5 -- 5 MB
Logger.backup_count = 5

-- Function to check if the log file needs rotation
local function needs_rotation()  
    local file_attr = lfs.attributes(Logger.filepath)
    if file_attr and file_attr.size > Logger.max_size then
        return true
    end
    return false
end

-- Function to rotate log files
local function rotate_logs()
    for i = Logger.backup_count, 1, -1 do
        local old_file = Logger.filepath .. '.' .. i
        local new_file = Logger.filepath .. '.' .. (i + 1)
        if lfs.attributes(old_file) then
            os.rename(old_file, new_file)
        end
    end
    os.rename(Logger.filepath, Logger.filepath .. '.1')
end

-- Function to log messages
function Logger.log(message)
    if needs_rotation() then
        rotate_logs()
    end
    local log_file = io.open(Logger.filepath, 'a')
    if log_file then
        log_file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        log_file:close()
    else
        error('Unable to open log file for writing.')
    end
end

return Logger