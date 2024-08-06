# if user opt to be code breaker
class CodeBreaker
  attr_accessor :master_code

  include Display
  LAST_TURN = 10
  def play
    @master_code = '1111'
    puts set_game
    start_turns
  end

  def start_turns # rubocop:disable Metrics/MethodLength
    turn = 1
    input_code = ''
    loop do
      show_turn(turn)
      puts '=> print input code in colored form and show hints'
      puts last_turn_warning if turn == LAST_TURN
      input_code = gets.chomp
      break if game_over?(turn, input_code)

      turn += 1
    end
    show_end_message(turn, input_code)
  end

  def game_over?(turn, input_code)
    turn == LAST_TURN || input_code == @master_code || %w[q Q].include?(input_code)
  end

  def show_end_message(turn, input_code)
    if turn == LAST_TURN || %w[q Q].include?(input_code)
      puts game_over_message
      reveal_code(@master_code)
    else
      show_win_message
    end
  end
end
