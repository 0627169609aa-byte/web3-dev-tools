-- Main processing loop with input validation

-- Function to validate user input
local function validateInput(input)
    if type(input) ~= "string" or #input == 0 then
        return false, "Input must be a non-empty string"
    end
    return true
end

-- Main processing function
local function processInputs(inputs)
    for _, input in ipairs(inputs) do
        local isValid, errorMsg = validateInput(input)
        if not isValid then
            print("Error: " .. errorMsg)
            return
        end
        -- Process valid input
        print("Processing: " .. input)
    end
end

-- Example usage
local userInputs = {"input1", "input2", "", 123}
processInputs(userInputs)