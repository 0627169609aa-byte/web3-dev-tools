-- Function to validate player input

local function validateInput(input)
    if type(input) ~= 'table' then
        return false, 'Input must be a table'
    end
    
    if not input.name or type(input.name) ~= 'string' or #input.name == 0 then
        return false, 'Name is required and must be a non-empty string'
    end

    if not input.level or type(input.level) ~= 'number' or input.level < 1 then
        return false, 'Level is required and must be a positive number'
    end

    if input.inventory and type(input.inventory) ~= 'table' then
        return false, 'Inventory must be a table if provided'
    end
    
    return true, 'Valid input'
end

-- Main processing loop
local function mainLoop(playerInput)
    local isValid, message = validateInput(playerInput)
    if not isValid then
        print('Input Error: ' .. message)
        return
    end
    
    -- Process valid player input
    print('Processing input for player: ' .. playerInput.name)
    -- Additional processing logic goes here
end

-- Example usage
local player = { name = 'Hero', level = 5, inventory = {} }
mainLoop(player)

local invalidPlayer = { name = '', level = 0 }
mainLoop(invalidPlayer)
