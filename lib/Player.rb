class Player
    def initialize(name, piece, board)
        @name = name 
        @piece = piece
        @board = board
    end

    def ask_move()
        loop do
            puts "Enter move to make "
            move = gets.chomp
            cordinate = map_cordinates(move)
            break if @board.add_piece(cordinate, @piece)
        end
    end

    private
    
        def map_cordinates(number)
            map = {
                "1" => [0,0],
                "2" => [0,1],
                "3" => [0,2],
                "4" => [1,0],
                "5" => [1,1],
                "6" => [1,2],
                "7" => [2,0],
                "8" => [2,1],
                "9" => [2,2],
            }
            map[number]
        end
end