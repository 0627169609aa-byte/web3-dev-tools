-- Logger configuration for web3-dev-tools
local log = require('logger')

local function setupLogger(logFilePath, maxSize, maxFiles)
    -- Create a new logger instance
    local logger = log.newLogger(logFilePath)
    
    -- Set the maximum size of each log file
    logger:setMaxSize(maxSize or 1048576) -- Default to 1 MB
    
    -- Set the maximum number of log files to keep
    logger:setMaxFiles(maxFiles or 5) -- Default to 5 rotated files
    
    return logger
end

-- Path for the log file
local logFilePath = './logs/app.log'
local maxSize = 2 * 1024 * 1024 -- 2 MB
local maxFiles = 3

-- Setup the logger and return it
local appLogger = setupLogger(logFilePath, maxSize, maxFiles)

return appLogger
