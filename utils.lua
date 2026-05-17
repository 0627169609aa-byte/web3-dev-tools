-- Logger setup with rotation in Lua

local logging = require('logging')
local logging_file = require('logging.file')
local lfs = require('lfs')

local Logger = {}

-- Function to create the directory if it doesn't exist
local function create_log_directory(directory)
    if not lfs.attributes(directory) then
        lfs.mkdir(directory)
    end
end

-- Function to setup the logger with rotation
function Logger.setup(name, log_dir, max_size, backups)
    create_log_directory(log_dir)
    local log_file = logging_file(log_dir .. '/' .. name)
    log_file:setRotationSize(max_size or 1048576)  -- Default 1MB
    log_file:setBackupCount(backups or 5)  -- Default 5 backups
    return log_file
end

-- Function to log messages
function Logger.log(logger, level, message)
    if logger then
        logger[level](logger, message)
    end
end

return Logger
