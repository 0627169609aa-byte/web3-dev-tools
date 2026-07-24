-- Logger setup with rotation in Lua

local lfs = require 'lfs'
local log_file_path = 'logs/application.log' -- path to log file
local max_size = 10 * 1024 * 1024 -- 10 MB

local function rotate_logs()
    local file = io.open(log_file_path, 'r')
    if file then
        local size = file:seek('end')
        file:close()
        if size >= max_size then
            local timestamp = os.date('%Y%m%d_%H%M%S')
            local new_log_path = 'logs/application_' .. timestamp .. '.log'
            os.rename(log_file_path, new_log_path)
        end
    end
end

local function log_message(level, message)
    rotate_logs()
    local file = io.open(log_file_path, 'a')
    file:write(string.format('%s [%s] %s\n', os.date('%Y-%m-%d %H:%M:%S'), level, message))
    file:close()
end

local logger = {}

function logger.info(message)
    log_message('INFO', message)
end

function logger.error(message)
    log_message('ERROR', message)
end

function logger.debug(message)
    log_message('DEBUG', message)
end

return logger
