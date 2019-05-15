require 'rspec'
require'./lib/Game'
require "./lib/Player"
require"./lib/Board"
describe Board do 
   describe '#add_piece' do

        let(:board) {Board.new}
        
        it 'returns true' do
            expect(board.add_piece(1,'X')).to eq (true)
        end
        it 'returns false' do
            board.add_piece(1,'X')
            expect(board.add_piece(1,'X')).to eq (false)
        end
   end
end