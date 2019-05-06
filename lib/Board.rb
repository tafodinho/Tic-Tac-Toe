class Board
    attr_accessor :board 
    
    def initialize()
        @board = Array.new(3){Array.new(3)}
    end 

    def add_piece(position, piece)
        if is_position_available(position)
            @board[position[0]][position[1]] = piece
            true
        else 
            puts "Posision is not available try another.."
            false
        end
    end

    def is_position_available(pos) 
        @board[pos[0]][pos[1]].nil?
    end

    def winner?(piece)
        diagonal_win?(piece) || horizontal_win?(piece) || veritcal_win?(piece)
    end

    def board_full?
        @board.all? do |row|
            row.none? {|value| value == nil }
        end
    end

    def diagonal_win?(piece)
        leading_diagonal = (0..2).collect {|index| @board[index][index]}.all? {|value| piece == value}
        lagging_diagonal = (0..2).collect {|index| @board[index][-index-1]}.all? {|value| piece == value}

        leading_diagonal || lagging_diagonal
    end

    def horizontal_win?(piece)
        @board.any? do |row|
            row.all? {|value| piece == value}
        end
    end

    def veritcal_win?(piece)
        col1 = []
        col2 = []
        col3 = []
        @board.each do |row|
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
