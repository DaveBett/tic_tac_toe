# frozen_string_literal: true

class Board
  def reset
    @first_row = '_1_|_2_|_3_'
    @second_row = '_4_|_5_|_6_'
    @third_row = ' 7 | 8 | 9 '
    puts move_result
  end

  def player_one_move(move)
    move = move.to_s

    @first_row = @first_row.gsub(move, 'x')
    @second_row = @second_row.gsub(move, 'x')
    @third_row = @third_row.gsub(move, 'x')

    puts move_result
  end

  def player_two_move(move)
    move = move.to_s

    @first_row = @first_row.gsub(move, 'o')
    @second_row = @second_row.gsub(move, 'o')
    @third_row = @third_row.gsub(move, 'o')

    puts move_result
  end

  private

  def move_result
    puts @first_row
    puts @second_row
    puts @third_row
  end
end
