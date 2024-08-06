# if user opt to be code breaker
class CodeBreaker
  attr_accessor :master_code

  include Display
  LAST_TURN = 10
  def play
    puts set_game
    start_turns
  end

  def start_turns
    turn = 1
    loop do
      show_turn(turn)
      puts 'print input code in colored form and show hints'
      puts last_turn_warning if turn == LAST_TURN
      input_code = gets.chomp
      break if game_over?(turn, 1111)

      turn += 1
    end
    turn == LAST_TURN ? reveal_code(@master_code) : show_win_message
  end

  def game_over?(turn, input_code)
    turn == LAST_TURN || input_code == @master_code
  end
end
