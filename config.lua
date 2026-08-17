-- Logger setup with rotation
local Logger = {}

local log_file_path = 'app.log'
local log_file_max_size = 10 * 1024 * 1024  -- 10 MB
local log_file = nil

local function rotate_log_file()
    if log_file then
        log_file:close()
    end
    os.rename(log_file_path, log_file_path .. os.date('%Y%m%d%H%M%S'))
    log_file = io.open(log_file_path, 'a')
end

local function log(message)
    if not log_file then
        log_file = io.open(log_file_path, 'a')
    end
    local current_size = log_file:seek('end')
    if current_size >= log_file_max_size then
        rotate_log_file()
    end
    log_file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
    log_file:flush()
end

function Logger.info(message)
    log('INFO: ' .. message)
end

function Logger.error(message)
    log('ERROR: ' .. message)
end

function Logger.close()
    if log_file then
        log_file:close()
    end
end

return Logger
