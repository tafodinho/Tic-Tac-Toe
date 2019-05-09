require_relative "UI"

class Board
    attr_accessor :board 

    include UserInterface
    def initialize()
        @board = [1,2,3,4,5,6,7,8,9]
    end 

    def add_piece(position, piece)
        if is_position_available(position)
            @board[position] = piece
            true
        else 
            self.print_taken
            false
        end
    end

    def is_position_available(pos) 
       if @board[pos] =='X' || @board[pos] =='O'
         false
       else
        true
       end
    end

    def board_full?
        @board.all? do |row|
            row.none? {|value| value == nil }
        end
    end

   
end
bo = Board.new
puts bo.is_position_available(1) 

puts bo.add_piece(1, 'X') 
puts bo.is_position_available(1) 
bo.show_board(bo)