-- Logger setup with rotation
local logger = {}
local log_file = 'app.log'
local max_size = 5 * 1024 * 1024 -- 5 MB

local function rotate_log_file()
    if not file.exists(log_file) then return end
    local current_size = file.size(log_file)
    if current_size >= max_size then
        local timestamp = os.date('%Y%m%d%H%M%S')
        local new_file = log_file .. '.' .. timestamp
        file.rename(log_file, new_file)
    end
end

function logger.log(message)
    rotate_log_file()
    local file = io.open(log_file, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    else
        print('Error opening log file')
    end
end

return logger
