-- Logger setup with rotation
local lfs = require('lfs')
local log_filename = 'app.log'
local max_log_size = 1024 * 1024 * 5  -- 5 MB

local function rotate_logs()
    local file = io.open(log_filename, 'r')
    if file then
        local file_size = file:seek('end')
        file:close()

        if file_size >= max_log_size then
            os.rename(log_filename, log_filename .. '.' .. os.date('%Y%m%d%H%M%S'))
        end
    end
end

local function log_message(message)
    rotate_logs()
    local file = io.open(log_filename, 'a')
    file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
    file:close()
end

return {
    log = log_message
}