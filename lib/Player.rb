require_relative "UI"

class Player
    include UserInterface
    attr_accessor :name, :piece
    
    def initialize(name, piece, board)
        @name = name 
        @piece = piece
        @board = board
        @moves = []
    end

    def ask_move
        loop do
            self.print_make_move
            move = gets.chomp
            break if @board.add_piece(cordinate, @piece)
        end
    end

end