require_relative "Player"
require_relative "Board"

class Game
    def initialize
        @board =  Board.new

        @player_1 = Player.new("Player 1", "X", @board)
        @player_2 = Player.new("Player 2", "O", @board)

        @current_player = @player_1
    end

    def play
        loop do 
            @board.show_board

            @current_player.ask_move 

            break if is_game_over?

            @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
        end
    end

    def is_game_over?

        is_victory? || is_draw?
    end

    private
        def is_victory?
            if @board.winner? @current_player.piece
                @board.show_board
                puts @current_player.name + " Has Wins!!!"
                true
            else
                false
            end
        end

        def is_draw?
            if @board.board_full?
                @board.show_board
                puts "Draw Game!!!"
                true
            else
                false
            end
        end
end

game = Game.new 
game.play