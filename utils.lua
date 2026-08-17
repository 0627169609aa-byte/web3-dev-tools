-- Utility functions for game management

local M = {}

-- Function to generate a unique identifier
function M.generateID()
    return tostring(math.random(1, 100000)) .. os.time()
end

-- Function to check if a table is empty
function M.isEmpty(t)
    return next(t) == nil
end

-- Function to deep copy a table
function M.deepcopy(orig)
    if type(orig) ~= 'table' then return orig end
    local copy = {}
    for k, v in pairs(orig) do
        copy[M.deepcopy(k)] = M.deepcopy(v)
    end
    return copy
end

-- Function to print a formatted message to the console
function M.logMessage(msg)
    print(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. msg)
end

-- Function to validate player data
function M.validatePlayerData(player)
    return player.name ~= nil and player.level ~= nil
end

return M