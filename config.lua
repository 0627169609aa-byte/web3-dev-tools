local log = require('logrotate')

local function setup_logger()
    local logger = log:new('/var/log/web3-game.log', {
        size = '10MB',
        backups = 5,
        level = 'info',
    })

    function logger:info(message)
        self:write('INFO: ' .. message)
    end

    function logger:error(message)
        self:write('ERROR: ' .. message)
    end

    function logger:warning(message)
        self:write('WARNING: ' .. message)
    end

    return logger
end

local logger = setup_logger()

function log_message(level, message)
    if level == 'info' then
        logger:info(message)
    elseif level == 'error' then
        logger:error(message)
    elseif level == 'warning' then
        logger:warning(message)
    end
end

return {
    log_message = log_message,
    logger = logger,
}