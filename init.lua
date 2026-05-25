-- type annotations for Lua using LuaJIT's support
-- @param string: name of the game
-- @param string: version of the game
-- @param table: options for game settings
-- @return table: initialized game settings

local Game = {}

--- Initializes a new game with specified settings
-- @param name string: the name of the game
-- @param version string: the version of the game
-- @param options table: additional settings for the game
-- @return table: the initialized game object
function Game:init(name, version, options)
    local gameSettings = {
        name = name,
        version = version,
        options = options or {},
        state = 'initialized',
    }
    return gameSettings
end

--- Starts the game
-- @param game table: the game object to start
function Game:start(game)
    if game.state ~= 'initialized' then
        error('Game must be initialized before starting')
    end
    game.state = 'running'
    print(game.name .. ' is now running!')
end

return Game
