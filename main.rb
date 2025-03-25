require_relative 'lib/game'

game = Board.new



puts 'Do you want to play again? (y/n)'
rematch = gets.chomp

if rematch.downcase == 'y'
  plr_one_pick = []
  plr_two_pick = []
  winner = false
  game.new_game
  play_game()
else
  puts 'Ok, bye!'
end
