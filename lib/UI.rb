module UserInterface 

    def show_board(board)
        system "clear" or system "cls"
        print "*---*---*---*\n"
        board.board.each_with_index do |row, index_outer|
            print " | "
            print row
            if index_outer == 2 || index_outer == 5 || index_outer == 8
                print "\n"
            end
        end
        print "*---*---*---*"
        print "\n"
   end

   def ask_move(board , player)
      print_make_move
      move = gets.chomp.to_i
     if board.add_piece(move, player.piece) 
        player.moves << move 
        return true
     end

    false
    end

   def print_winner(player)
    puts player.name + " Has Won!!!"
   end
   
   def print_draw
     puts "Draw Game!!!"
   end
   def print_taken
     puts "Position is not available try another.."
   end
   def print_make_move
     puts "Enter move to make "
    end
end