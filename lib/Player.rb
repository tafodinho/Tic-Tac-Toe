require_relative "UI"

class Player
    include UserInterface
    attr_accessor :moves
    def initialize(name, piece, board)
        @name = name 
        @piece = piece
        @board = board
        @moves = []
    end

    def ask_move
        self.print_make_move
        move = gets.chomp.to_i
        @moves << move if @board.add_piece(move, @piece)
    end

end