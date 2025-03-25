# frozen_string_literal: true

require_relative 'lib/game'

puts "Enter player one's name: "
player_one = gets.chomp

puts "Enter player two's name: "
player_two = gets.chomp

new_game = Game.new(player_one, player_two)
new_game.play_game

rematch = false
until rematch
  puts 'Do you want to play again? (y/n)'
  rematch = gets.chomp

  if rematch.downcase == 'y'
    new_game.play_game
    rematch = false
  else
    puts 'Ok, bye!'
  end
end
