local function validateInput(input)
    if type(input) ~= "table" then
        return false, "Input must be a table."
    end
    for key, value in pairs(input) do
        if type(key) ~= "string" then
            return false, "Keys must be strings."
        end
        if not value or (type(value) ~= "string" and type(value) ~= "number") then
            return false, "Values must be non-empty strings or numbers."
        end
    end
    return true, nil
end

local function processData(input)
    local isValid, err = validateInput(input)
    if not isValid then
        error("Validation Error: " .. err)
    end
    -- Process input data here
end

local function mainLoop()
    while true do
        local userInput = getUserInput()  -- Assume this function retrieves user input
        local isValid, err = validateInput(userInput)
        if isValid then
            processData(userInput)
        else
            print("Error: " .. err)
        end
    end
end

mainLoop()