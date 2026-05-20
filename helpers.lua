-- Utility function to convert wei to ether
local function weiToEther(wei)
    return wei / 10^18
end

-- Utility function to convert ether to wei
local function etherToWei(ether)
    return ether * 10^18
end

-- Utility function to generate a random ID
local function generateRandomID(length)
    local charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    local result = ''
    for i = 1, length do
        local rand = math.random(#charset)
        result = result .. charset:sub(rand, rand)
    end
    return result
end

-- Utility function to check if an address is valid
local function isValidAddress(address)
    return string.match(address, '^0x%x+$') and #address == 42
end

return {
    weiToEther = weiToEther,
    etherToWei = etherToWei,
    generateRandomID = generateRandomID,
    isValidAddress = isValidAddress,
}