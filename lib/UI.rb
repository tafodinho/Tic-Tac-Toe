module UserInterface 

    def show_board(board)
        system "clear" or system "cls"
        print "*---*---*---*\n"
        board.board.each_with_index do |row, index_outer|
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

   def print_winner(player)
    puts player.name + " Has Won!!!"
   end
   
   def print_draw
     puts "Draw Game!!!"
   end
   def print_taken
     puts "Posision is not available try another.."
   end
   def print_make_move
     puts "Enter move to make "
    end
end