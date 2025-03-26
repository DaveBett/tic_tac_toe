# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
  end

  def play_game
    @board.reset

    win_comb =
      [[1, 2, 3], [4, 5, 6], [7, 8, 9],
       [1, 5, 6], [3, 5, 7], [1, 4, 7],
       [2, 5, 8], [3, 6, 9]]

    plr_one_pick = []
    plr_two_pick = []
    winner = false

    until winner
      pick = false
      puts "#{@player_one}'s turn, choose a number on the board: "
      pick = gets.chomp.to_i

      if plr_one_pick.include?(pick) || plr_two_pick.include?(pick) || pick > 9
        puts 'Position invalid'
        redo
      end

      @board.player_one_move(pick)
      plr_one_pick.push(pick)

      win_comb.each do |win|
        if win & plr_one_pick.sort == win
          winner = @player_one
          break
        end
      end

      break if winner

      if plr_one_pick.length >= 5
        puts 'The game is a tie.'
        winner = 'No one'
        break
      end

      pick = false

      until pick
        puts "#{@player_two}'s turn, choose a number on the board: "
        pick = gets.chomp.to_i

        if plr_one_pick.include?(pick) || plr_two_pick.include?(pick) || pick > 9
          puts 'Position invalid'
          pick = false
          redo
        end

        @board.player_two_move(pick)
        plr_two_pick.push(pick)

        win_comb.each do |win|
          if win == win & plr_two_pick.sort
            winner = @player_two
            break
          end
        end

        break if winner
      end
    end
    puts "#{winner} is the winner"
  end
end
