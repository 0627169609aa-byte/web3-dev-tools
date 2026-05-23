-- Logger setup with rotation in Lua

local logger = {}
local currentLogSize = 0
local maxLogSize = 1024 * 1024 -- 1MB
local logFilePath = 'app.log'

function logger.log(message)
    local file = io.open(logFilePath, "a")
    if file then
        file:write(os.date("%Y-%m-%d %H:%M:%S") .. ' - ' .. message .. '\n')
        file:close()
        currentLogSize = currentLogSize + #message + 1
        checkLogRotation()
    end
end

function checkLogRotation()
    if currentLogSize >= maxLogSize then
        rotateLog()
    end
end

function rotateLog()
    local dateSuffix = os.date("%Y%m%d_%H%M%S")
    local backupFilePath = 'app_' .. dateSuffix .. '.log'
    os.rename(logFilePath, backupFilePath)
    currentLogSize = 0
    logger.log('Log rotated: ' .. backupFilePath)
end

return logger
