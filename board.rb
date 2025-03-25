class Board

  def new_game()
    @first_row = '_1_|_2_|_3_'
    @second_row = '_4_|_5_|_6_'
    @third_row = ' 7 | 8 | 9 '
    puts self.move_result
  end

  def x_player_move(move)
    move = move.to_s

    @first_row = @first_row.gsub(move, 'x')
    @second_row = @second_row.gsub(move, 'x')
    @third_row = @third_row.gsub(move, 'x')
    
    puts self.move_result()
  end

  def o_player_move(move)
    move = move.to_s

    @first_row = @first_row.gsub(move, 'o')
    @second_row = @second_row.gsub(move, 'o')
    @third_row = @third_row.gsub(move, 'o')
    
    puts self.move_result()
  end

  private

  def move_result()
        puts @first_row
        puts @second_row
        puts @third_row 
  end

end

game = Board.new
game.new_game