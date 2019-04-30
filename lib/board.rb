class Board
    def initialize()
        @board = Array.new(3){Array.new(3)}
        @board = [[1,8,1], [1,2,1], [2,1,1]]
    end
   # cordinate = { "1" => [0,0], "2" => [0,1], "3" =>[0,2], "4" => [1,0], "5" => [1,1], "6" =>[1,2],"7" => [2,0], "8" => [2,1], "9" =>[2,2] }
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

   def show_board()
        print "*---*---*---*\n"
        @board.each_with_index do |row, index_outer|
            print "|"
            row.each_with_index do |value, index_inner|
                if value.nil?
                    print " "
                    print (index_inner + index_outer * 3) + 1
                    print " "
                else
                    print " "
                    print value
                    print " "
                end
            end
            print "|"
            print "\n"
        end
        print "*---*---*---*"

   end

    def board_full?()
        @board.all? do |row|
            row.none? {|value| value == nil }
        end
    end

    def diagonal_win(piece)
        leading_diagonal = (0..2).collect {|index| @board[index][index]}.all? {|value| piece == value}
        lagging_diagonal = (0..2).collect {|index| @board[index][-index-1]}.all? {|value| piece == value}

        leading_diagonal || lagging_diagonal
    end

    def horizontal_win(piece)
        @board.any? do |row|
            row.all? {|value| piece == value}
        end
    end

    def veritcal_win()
    
    end
end

board = Board.new 
board.show_board
# puts board.board_full?
# board.add_piece([0,0], "x")
# board.show_board
puts board.diagonal_win(2)
puts board.horizontal_win(1)