require_relative "lib/Player"
require_relative "lib/Board"
require_relative "lib/UI"
require_relative "lib/Game"

board =  Board.new
player_1 = Player.new("Player 1", "X", board)
player_2 = Player.new("Player 2", "O", board)
ui = UserInterface.new(board)

game = Game.new(board, player_1, player_2, ui)
game.play