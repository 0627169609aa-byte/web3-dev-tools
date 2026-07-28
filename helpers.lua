-- Helper functions for common operations

-- Function to calculate the damage of an attack
-- @param baseDamage: the base damage of the attack
-- @param critMultiplier: the critical hit multiplier
-- @param isCritical: boolean indicating if it is a critical hit
-- @return calculated damage
function calculateDamage(baseDamage, critMultiplier, isCritical)
    if isCritical then
        return baseDamage * critMultiplier
    end
    return baseDamage
end

-- Function to check if a player has enough resources
-- @param playerResources: table containing player's resources
-- @param requiredResources: table containing required resources
-- @return boolean
function hasEnoughResources(playerResources, requiredResources)
    for resource, amount in pairs(requiredResources) do
        if playerResources[resource] == nil or playerResources[resource] < amount then
            return false
        end
    end
    return true
end

-- Function to get a user's current level based on experience points
-- @param experience: the total experience points
-- @return level
function getUserLevel(experience)
    return math.floor(experience / 100)
end

-- Function to format the player's score for display
-- @param score: the player's score
-- @return formatted score string
function formatScore(score)
    return string.format('Score: %d', score)
end

-- Function to generate a random number within a range
-- @param min: minimum number (inclusive)
-- @param max: maximum number (inclusive)
-- @return random number between min and max
function getRandomNumber(min, max)
    return math.random(min, max)
end