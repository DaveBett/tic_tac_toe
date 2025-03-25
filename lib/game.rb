require_relative 'board'

class Game
  
  def initialize(player_one, player_two)
        @player_one = player_one
        @player_two = player_two
        @board = Board.new
  end

  def play_game

    win_comb = 
    [[1, 2, 3], [4, 5, 6], [7, 8 ,9],
     [1, 5, 6], [3, 5, 7], [1, 4, 7],
     [2, 5, 8], [3, 6, 9]]

    plr_one_pick = []
    plr_two_pick = []
    winner = false

    until winner do
      pick = ''
      puts "#{@player_one}'s turn, choose a number on the board: "
      pick = gets.chomp
        
      if plr_one_pick.include?(pick) || plr_two_pick.include?(pick)
        puts 'Position already taken, choose another one'
        break
      end

      game.player_one_move(pick)
      plr_one_pick.push(pick)


      win_comb.each do |win|
        if win == plr_one_pick.sort
          winner = player_one
        end
      end 

      if (plr_one_pick.length + plr_two_pick.length >= 9)
        puts 'The game is a tie.'
        winner = 'No one'
      end

      unless winner
        until pick
          pick = ''
          puts "#{player_two}'s turn, choose a number on the board: "
          pick = gets.chomp

          if plr_one_pick.include?(pick) || plr_two_pick.include?(pick)
            puts 'Position already taken, choose another one'
            pick = ''
            break
          end

          game.player_two_move(pick)

          win_comb.each do |win|
            if win == plr_two_pick.sort
              winner = player_two
            end
          end 
        end
      end
    end
    puts "#{winner} is the winner"
  end
end