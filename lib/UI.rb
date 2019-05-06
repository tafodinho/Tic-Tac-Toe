class UserInterface 

    def initialize(board)
        @board = board
    end

    def show_board
        system "clear" or system "cls"
        print "*---*---*---*\n"
        @board.board.each_with_index do |row, index_outer|
            print "| "
            row.each_with_index do |value, index_inner|
                if value.nil?
                    print " "
                    print (index_inner + index_outer * 3) + 1
                    print " "
                else
                    print " "
                    print value
                    print " "
                end
            end
            print " | "
            print "\n"
        end
        print "*---*---*---*"
        print "\n"
   end

end