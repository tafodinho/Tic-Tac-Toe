class Board
    def initialize()
        @board = Array.new(3){Array.new(3)}
    end
   # cordinate = { "1" => [0,0], "2" => [0,1], "3" =>[0,2], "4" => [1,0], "5" => [1,1], "6" =>[1,2],"7" => [2,0], "8" => [2,1], "9" =>[2,2] }
   def add_piece(position, piece)

   end
   def show_board()
        print "*---*---*---*\n"
        @board[1][2] = "X"
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

    def board_full()
        
    end

    def diagonal_win()

    end

    def horizontal_win()

    end

    def veritcal_win()
    
    end
end

board = Board.new 

board.show_board