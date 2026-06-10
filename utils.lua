-- Function to validate player input
local function validate_input(input)
    if type(input) ~= 'string' then
        return false, 'Input must be a string'
    end
    if #input == 0 then
        return false, 'Input cannot be empty'
    end
    return true, ''
end

-- Main processing loop
local function main_processing_loop()
    while true do
        local input = io.read()  -- Read input from the user
        local is_valid, error_message = validate_input(input)
        if not is_valid then
            print('Error: ' .. error_message)  -- Print error message
            goto continue
        end

        -- Process the valid input
        print('Processing: ' .. input)
        -- Add more processing logic here as needed

        ::continue::  -- Continue loop
    end
end

-- Execute the main loop
main_processing_loop()