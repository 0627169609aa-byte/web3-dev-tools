-- Core game logic for web3-based gaming
local game = {}

-- Initializes the game state
function game.init()
    game.state = {
        players = {},
        turn = 1,
        winner = nil
    }
end

-- Adds a player to the game
function game.addPlayer(playerName)
    table.insert(game.state.players, playerName)
end

-- Sets the current turn
function game.setTurn(turn)
    game.state.turn = turn
end

-- Determines if there's a winner
function game.checkWinner()
    if #game.state.players == 0 then
        return nil
    end
    -- Simple logic for a winner based on a random selection
    if math.random() > 0.5 then
        game.state.winner = game.state.players[1]
    else
        game.state.winner = game.state.players[2]
    end
    return game.state.winner
end

-- Resets the game state
function game.reset()
    game.init()
end

return game
