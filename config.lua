-- logger setup for web3-dev-tools
local log = require('log')
local lfs = require('lfs')

local function setupLogger(logFile)
    -- create logs directory if it doesn't exist
    local logDir = 'logs'
    if not lfs.attributes(logDir) then
        lfs.mkdir(logDir)
    end

    -- define log file path
    local fullLogPath = logDir .. '/' .. logFile

    -- create logger with rotation
    local logger = log:new({
        file = fullLogPath,
        level = log.levels.INFO,
        maxSize = 10 * 1024 * 1024,  -- 10 MB
        maxFiles = 5,
        rotate = true,
    })

    return logger
end

-- set up the logger
local logger = setupLogger('app.log')

-- export logger for use in other modules
return { logger = logger }