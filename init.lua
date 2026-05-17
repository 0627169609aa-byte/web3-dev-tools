-- Logger setup with rotation

local log = require('log')
local lfs = require('lfs')
local rotation_interval = 24 * 60 * 60 -- Rotate every 24 hours
local log_file = 'game_log.txt'
local max_log_size = 5 * 1024 * 1024 -- 5 MB

-- Function to check and rotate log files
local function rotate_log()
    local log_size = lfs.attributes(log_file, 'size')
    if log_size and log_size > max_log_size then
        local timestamp = os.date('%Y%m%d_%H%M%S')
        local new_log_file = string.format('game_log_%s.txt', timestamp)
        os.rename(log_file, new_log_file)
    end
end

-- Logger function
local function logger(message)
    rotate_log()
    local log_entry = string.format('%s - %s\n', os.date('%Y-%m-%d %H:%M:%S'), message)
    local file = io.open(log_file, 'a')
    if file then
        file:write(log_entry)
        file:close()
    else
        print('Failed to open log file')
    end
end

-- Set up timed rotation check
local function start_rotation_timer()
    while true do
        logger('Checking log rotation')
        rotate_log()
        os.execute('sleep ' .. rotation_interval)
    end
end

-- Start the logger
logger('Logger initialized')
start_rotation_timer()

return { log = logger }