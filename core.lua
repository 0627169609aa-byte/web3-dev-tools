-- Performance optimization for game loop
local Game = {}
local frameTime = 0.016  -- Target frame time (60 FPS)

function Game:new(o)
    o = o or { updateTime = 0, objects = {} }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Game:addObject(obj)
    table.insert(self.objects, obj)
end

function Game:update(dt)
    self.updateTime = self.updateTime + dt
    if self.updateTime >= frameTime then
        self:updateObjects(dt)
        self.updateTime = 0
    end
end

function Game:updateObjects(dt)
    for _, obj in ipairs(self.objects) do
        if obj.update then
            obj:update(dt)
        end
    end
end

function Game:run()
    local lastTime = os.clock()
    while true do
        local currentTime = os.clock()
        local dt = currentTime - lastTime
        self:update(dt)
        lastTime = currentTime
        -- Insert rendering code here
    end
end

return Game
