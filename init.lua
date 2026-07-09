-- Main processing loop for the game

local function isValidInput(input)
    if type(input) ~= "string" then
        return false, "Input must be a string."
    end
    if input:match("^[%w%s]+$") == nil then
        return false, "Input contains invalid characters."
    end
    return true
end

local function processInput(input)
    local valid, err = isValidInput(input)
    if not valid then
        print(err)
        return
    end
    -- Process the valid input
    print("Processing input: " .. input)
end

local function main()
    while true do
        print("Please enter your command:")
        local input = io.read()
        processInput(input)
    end
end

main()
