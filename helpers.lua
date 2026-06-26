-- Logger setup with rotation

local lfs = require('lfs')
local logFilePath = 'logs/app.log'
local maxFileSize = 10 * 1024 * 1024 -- 10 MB
local backupCount = 5

local function rotateLogFile()
    if lfs.attributes(logFilePath, 'size') >= maxFileSize then
        local backupFilePath = logFilePath .. '.' .. os.date('%Y%m%d%H%M%S')
        os.rename(logFilePath, backupFilePath)
        if lfs.attributes(backupFilePath) then
            local fileCount = 0
            for file in lfs.dir('logs') do
                if file:match('^app.log%.%d+%d+%d+%d+%d+%d+$') then
                    fileCount = fileCount + 1
                    if fileCount > backupCount then
                        os.remove('logs/' .. file)
                    end
                end
            end
        end
    end
end

local function log(message)
    rotateLogFile()
    local file = io.open(logFilePath, 'a')
    if file then
        file:write(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message .. '\n')
        file:close()
    end
end

return { log = log }