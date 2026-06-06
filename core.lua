-- Main processing loop for game actions

local function isValidInput(input)
    if type(input) ~= 'table' then
        return false, 'Input must be a table'
    end
    if not input.action or type(input.action) ~= 'string' then
        return false, 'Action is required and must be a string'
    end
    return true
end

local function processGameAction(input)
    local valid, err = isValidInput(input)
    if not valid then
        print('Error: ' .. err)
        return
    end

    -- Process the action based on the valid input
    if input.action == 'move' then
        print('Moving character to coordinates: ', input.x, input.y)
        -- Logic to move character
    elseif input.action == 'attack' then
        print('Character attacking target: ', input.target)
        -- Logic to attack
    else
        print('Unknown action: ' .. input.action)
    end
end

-- Example main loop
for _, input in ipairs({
    { action = 'move', x = 5, y = 10 },
    { action = 'attack', target = 'enemy1' },
    { action = 'jump' },
    { action = 123 }
}) do
    processGameAction(input)
end
