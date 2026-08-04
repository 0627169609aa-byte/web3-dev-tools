-- logger.lua
local Logger = {}

-- log levels
Logger.levels = {
    DEBUG = 1,
    INFO = 2,
    WARN = 3,
    ERROR = 4,
    FATAL = 5,
}

-- default log level
Logger.currentLevel = Logger.levels.INFO

-- set log level
function Logger:setLevel(level)
    self.currentLevel = level
end

-- check log level
function Logger:shouldLog(level)
    return level >= self.currentLevel
end

-- log message with rotation
function Logger:log(level, message)
    if self:shouldLog(level) then
        local timestamp = os.date('%Y-%m-%d %H:%M:%S')
        local logMessage = string.format('%s [%s] %s', timestamp, level, message)

        -- write log to file with rotation
        local logfile = 'app.log'
        local file = io.open(logfile, 'a')
        if file then
            file:write(logMessage .. '\n')
            file:close()
        end
         
        -- check log file size and rotate if necessary
        if self:checkFileSize(logfile) then
            self:rotateLogFile(logfile)
        end
    end
end

-- check if log file exceeds size limit
function Logger:checkFileSize(filename)
    local file = io.open(filename, 'r')
    if file then
        local size = file:seek('end')
        file:close()
        return size > 1024 * 1024 -- 1 MB limit
    end
    return false
end

-- rotate log file
function Logger:rotateLogFile(filename)
    os.rename(filename, filename .. '.' .. os.date('%Y%m%d%H%M%S'))
end

return Logger
