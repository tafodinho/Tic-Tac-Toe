require_relative "UI"

class Player
    include UserInterface
    attr_accessor :moves, :piece, :name
    def initialize(name, piece, board)
        @name = name 
        @piece = piece
        @board = board
        @moves = []
    end
end