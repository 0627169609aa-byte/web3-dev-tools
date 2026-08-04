-- Logger setup with rotation for web3 gaming
local lfs = require("lfs")
local log_file = "app.log"

local function setup_logger(max_size)
    local function rotate_file()
        if lfs.attributes(log_file, "size") and lfs.attributes(log_file, "size") > max_size then
            local timestamp = os.date("%Y%m%d_%H%M%S")
            local new_file = log_file .. "." .. timestamp
            os.rename(log_file, new_file)
        end
    end

    local function log(message)
        rotate_file()
        local file = io.open(log_file, "a+")
        if file then
            file:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. message .. "\n")
            file:close()
        end
    end

    return log
end

local logger = setup_logger(1048576) -- 1 MB

return {
    log = logger
}