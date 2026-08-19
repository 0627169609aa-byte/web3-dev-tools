-- Logger setup with rotation

local logger = require('logger')
local path = require('path')
local os = require('os')
local lfs = require('lfs')

local log_directory = 'logs'
local max_size = 1024 * 1024 * 5  -- 5MB
local log_file = path.join(log_directory, 'app.log')

-- Ensure the log directory exists
if not lfs.attributes(log_directory) then
    lfs.mkdir(log_directory)
end

local function rotate_log()
    if lfs.attributes(log_file) then
        local current_size = lfs.attributes(log_file, 'size')
        if current_size and current_size >= max_size then
            local timestamp = os.date('%Y%m%d%H%M%S')
            local archived_file = path.join(log_directory, 'app_' .. timestamp .. '.log')
            os.rename(log_file, archived_file)
        end
    end
end

-- Setup the logger with rotation
local function setup_logger()
    rotate_log()
    logger.open(log_file)
    logger.set_level('info')  -- Set default log level
end

return { setup_logger = setup_logger }