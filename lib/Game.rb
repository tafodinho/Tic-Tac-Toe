
class Game
    include UserInterface
    def initialize(board, player1, player2)
        @board =  board
        @player_1 = player1
        @player_2 = player2
        @current_player = @player_1
    end
    WIN_COMBO = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
     ]

    def play
        loop do 
            show_board(@board)
            ask_move(@board , @current_player)
            if is_game_over?
                if is_victory? 
                    show_info(1)
                elsif(is_draw?)
                    show_info(0)
                end
                break
            end
            @current_player = @current_player == @player_1 ? @player_2 : @player_1
        end
    end

    def is_game_over?
      is_victory? || is_draw?
    end

    private
        def is_victory?
          winner? ? true : false
        end

        def show_info(code)
            show_board(@board)
            if code == 1
                print_winner(@current_player)
            else
                print_draw
            end
        end
        def is_draw?
          @board.board_full? ? true : false 
        end

        def winner?
            is_true = false
            WIN_COMBO.each do |arr| 
                moves = arr & @current_player.moves
                if arr == moves
                    is_true = true
                end
            end
            is_true
        end
end
