require 'rspec'
require'./lib/Game'
require "./lib/Player"
require"./lib/Board"

describe Game do 

   let(:board) { Board.new}
   let(:player_1) {Player.new("Player 1", "X", board)}
   let(:player_2) {Player.new("Player 2", "O", board)}
   let(:game) {Game.new(board, player_1, player_2)}

   describe '#is_game_over?' do 
      it 'returns false when there is no winner' do
         expect(game.is_game_over?).to eq (false)
      end
      it 'returns true when there is a winner' do
          player_1.moves = [0,1,2]
         expect(game.is_game_over?).to eq (true)
      end
   end
   describe '#play' do
      it 'returns nil when execution is complete' do
         player_1.moves = [0,1,2]
         expect(game.play).to eq (nil)
      end
   end
   describe '#Winner?' do
      it 'returns true when there is a winning combination' do
         player_1.moves = [0,1,2,4,5]
         expect(game.winner?).to eq (true)
      end
   end
   describe '#Winner?' do
      it 'returns false when there is no winning combination' do
         player_1.moves = [0,6,8,5]
         expect(game.winner?).to eq (false)
      end
   end
end