require_relative 'lib/game'

def play_game
  game = Game.new
  game.play
  repeat_game
end

def repeat_game
  puts 'Would you like to play again? [y/n]'
  user_input = gets.chomp.downcase
  if user_input == 'y'
    play_game
  else
    puts 'Thanks for playing! Goodbye!'
  end
end

play_game
