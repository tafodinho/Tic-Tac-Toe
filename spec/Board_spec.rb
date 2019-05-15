require 'rspec'
require'./lib/Game'
require "./lib/Player"
require"./lib/Board"
describe Board do 
   describe '#add_piece' do
      it 'returns true' do
         board =  Board.new
         expect(board.add_piece(1,'X')).to eq (true)
      end
      it 'returns false' do
        board2 =  Board.new
        board2.add_piece(1,'X')
        expect(board2.add_piece(1,'X')).to eq (false)
      end
   end
end