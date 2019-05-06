require_relative "lib/Player"
require_relative "lib/Board"

class Game
    def initialize(board, player1, player2)
        @board =  board
        @player_1 = player1
        @player_2 = player2
        @current_player = @player_1
    end

    def play
        loop do 
            @board.show_board
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

board =  Board.new
player_1 = Player.new("Player 1", "X", board)
player_2 = Player.new("Player 2", "O", board)
game = Game.new(baoard, player1, player2)
game.play