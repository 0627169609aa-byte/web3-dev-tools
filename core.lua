-- Main processing loop for validating input

local function isValidInput(input)
    if type(input) ~= "string" then
        return false, "Input must be a string"
    end
    if #input == 0 then
        return false, "Input cannot be empty"
    end
    return true, ""
end

local function processInput(input)
    local valid, errMsg = isValidInput(input)
    if not valid then
        print("Error: " .. errMsg)
        return
    end
    print("Processing input: " .. input)
    -- Here would be the main processing logic for valid input
end

-- Simulating some inputs
local inputs = { "Hello, World!", "", 12345, "Lua Programming" }

for _, input in ipairs(inputs) do
    processInput(input)
end
