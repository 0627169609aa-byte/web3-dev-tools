-- Initialize logging setup with rotation
local lfs = require('lfs')
local log_filepath = 'logs/games_log.txt'
local max_log_size = 5 * 1024 * 1024 -- 5 MB

local function rotate_logs()
    local file = io.open(log_filepath, 'r')
    if file then
        local size = file:seek('end')
        file:close()

        if size >= max_log_size then
            os.rename(log_filepath, log_filepath .. '.' .. os.date('%Y%m%d%H%M%S'))
            local new_log_file = io.open(log_filepath, 'w')
            new_log_file:close()
        end
    end
end

local function log_message(message)
    rotate_logs()
    local file = io.open(log_filepath, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    end
end

-- Example Usage
log_message('Logger initialized')
log_message('Game started')

return { log = log_message }