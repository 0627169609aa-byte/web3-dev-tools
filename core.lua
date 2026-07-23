-- Logger setup with rotation

local logging = require('logging')
local logFile = 'app.log'
local maxFileSize = 10 * 1024 * 1024  -- 10 MB

local function rotateLogs()
    local stats = lfs.attributes(logFile)
    if stats and stats.size >= maxFileSize then
        local date = os.date('%Y-%m-%d_%H-%M-%S')
        local newLogFile = string.format('app_%s.log', date)
        os.rename(logFile, newLogFile)
    end
end

local function logMessage(level, message)
    rotateLogs()  -- Check and rotate logs if necessary
    local logger = logging.file(logFile)
    logger:log(level, message)
end

local function info(message)
    logMessage(logging.INFO, message)
end

local function error(message)
    logMessage(logging.ERROR, message)
end

return {
    info = info,
    error = error,
}