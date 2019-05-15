require 'rspec'
require'./lib/Game'
require "./lib/Player"
require"./lib/Board"
describe Board do 
   describe '#add_piece' do

        let(:board) {Board.new}

        it 'returns true when piece is added succesfully' do
            expect(board.add_piece(1,'X')).to eq (true)
        end
        it 'returns false when piece fails to be added' do
            board.add_piece(1,'X')
            expect(board.add_piece(1,'X')).to eq (false)
        end
   end
end