require 'rspec'
require'./lib/Game'
require "./lib/Player"
require"./lib/Board"

describe Game do 
   describe '#winner?' do
      it 'returns false' do
         board =  Board.new
         player_1 = Player.new("Player 1", "X", board)
         player_2 = Player.new("Player 2", "O", board)
         game = Game.new(board, player_1, player_2)
         expect(game.is_game_over?).to eq (false)
      end
      it 'returns true' do
         board =  Board.new
         player_3 = Player.new("Player 1", "X", board)
         player_4 = Player.new("Player 2", "O", board)
         player_3.moves = [0,1,2]
         game = Game.new(board, player_3, player_4)
         expect(game.is_game_over?).to eq (true)
      end
   end
   describe '#play' do
      it 'returns false' do
         board =  Board.new
         player_1 = Player.new("Player 1", "X", board)
         player_2 = Player.new("Player 2", "O", board)
         game = Game.new(board, player_1, player_2)
         expect(game.play).to eq (nil)
      end
   end
end