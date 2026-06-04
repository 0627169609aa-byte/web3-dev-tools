-- Configuration Settings for Web3 Gaming

local Config = {}

-- Function to load configuration from a file
local function loadConfig(filePath)
    local file, err = io.open(filePath, 'r')
    if not file then
        error('Could not open configuration file: ' .. err)
    end
    local content = file:read('*a')
    file:close()
    return content
end

-- Function to parse configuration
local function parseConfig(content)
    local success, result = pcall(function()
        return loadstring(content)()
    end)
    if not success then
        error('Error parsing configuration: ' .. result)
    end
    return result
end

-- Load the configuration if the path is provided
function Config.load(filePath)
    if not filePath then
        error('File path must be provided')
    end
    local content = loadConfig(filePath)
    return parseConfig(content)
end

return Config
