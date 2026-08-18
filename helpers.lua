--[[
  Performance optimizations for game actions
]]

local M = {}

-- Optimize event handling with a cached lookup table
local eventCache = {}

function M.registerEvent(eventName, callback)
    if not eventCache[eventName] then
        eventCache[eventName] = {}
    end
    table.insert(eventCache[eventName], callback)
end

function M.triggerEvent(eventName, ...)
    if eventCache[eventName] then
        for _, callback in ipairs(eventCache[eventName]) do
            callback(...)  -- Call the registered callback with provided arguments
        end
    end
end

function M.clearEvents(eventName)
    if eventName and eventCache[eventName] then
        eventCache[eventName] = nil  -- Clear specific events for garbage collection
    else
        eventCache = {}  -- Clear all events if eventName is nil
    end
end

return M
