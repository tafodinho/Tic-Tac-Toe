

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
