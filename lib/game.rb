require_relative 'display'
require_relative 'code_breaker'
require_relative 'code_maker'

# game flow
class Game
  include Display
  def play
    puts show_instruction
    input = gets.chomp.to_i
    input == 1 ? play_as_maker : play_as_breaker
  end

  def play_as_breaker
    breaker = CodeBreaker.new
    breaker.play
  end
end
