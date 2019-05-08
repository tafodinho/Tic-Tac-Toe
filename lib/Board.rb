class Board
    attr_accessor :board 
    
    def initialize()
        @board = Array.new(3){Array.new(3)}
    end 

    def add_piece(position, piece)
        if is_position_available(position)
            @board[position[0]][position[1]] = piece
            true
        else 
            puts "Posision is not available try another.."
            false
        end
    end

    def is_position_available(pos) 
        @board[pos[0]][pos[1]].nil?
    end


    def board_full?
        @board.all? do |row|
            row.none? {|value| value == nil }
        end
    end

   
end
