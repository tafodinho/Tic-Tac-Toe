require_relative "lib/Player"
require_relative "lib/Board"
require_relative "lib/UI"

class Game
    def initialize(board, player1, player2, ui)
        @ui = ui
        @board =  board
        @player_1 = player1
        @player_2 = player2
        @current_player = @player_1
    end

    def play
        loop do 
            @ui.show_board
            @current_player.ask_move 
            break if is_game_over?
            @current_player = @current_player == @player_1 ? @player_2 : @player_1
        end
    end

    def is_game_over?
        is_victory? || is_draw?
    end

    private
        def is_victory?
            if @board.winner? @current_player.piece
                @ui.show_board
                @ui.print_winner(@current_player)
                true
            else
                false
            end
        end

        def is_draw?
            if @board.board_full?
                @ui.show_board
                @ui.print_draw
                true
            else
                false
            end
        end
end

board =  Board.new
player_1 = Player.new("Player 1", "X", board)
player_2 = Player.new("Player 2", "O", board)
ui = UserInterface.new(board)

game = Game.new(board, player_1, player_2, ui)
game.play