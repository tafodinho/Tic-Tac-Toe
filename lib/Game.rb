

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
            if winner? @current_player.piece
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

        def winner?(piece)
            diagonal_win?(piece) || horizontal_win?(piece) || veritcal_win?(piece)
        end

        def diagonal_win?(piece)
            leading_diagonal = (0..2).collect {|index| @board.board[index][index]}.all? {|value| piece == value}
            lagging_diagonal = (0..2).collect {|index| @board.board[index][-index-1]}.all? {|value| piece == value}
    
            leading_diagonal || lagging_diagonal
        end
    
        def horizontal_win?(piece)
            @board.board.any? do |row|
                row.all? {|value| piece == value}
            end
        end
    
        def veritcal_win?(piece)
            col1 = []
            col2 = []
            col3 = []
            @board.board.each do |row|
                row.each_with_index do |value, index2|
                    if index2 == 0
                        col1 << value
                    elsif index2 == 1
                        col2 << value
                    else
                        col3 << value
                    end
                end
            end
            col1.all? {|value| piece == value} || col2.all? {|value| piece == value} || col3.all? {|value| piece == value}
        end
end
