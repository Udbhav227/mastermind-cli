# if user opt to be code breaker
class CodeBreaker
  attr_accessor :master_code

  LAST_TURN = 10
  include Display
  include GameLogic
  def play
    @master_code = (4.times.map { rand(1..6).to_s }).join
    puts set_game
    start_turns
  end

  def start_turns # rubocop:disable Metrics/MethodLength
    turn = 1
    guess = ''
    loop do
      show_turn(turn)
      puts last_turn_warning if turn == LAST_TURN
      guess = gets.chomp
      break if game_over?(@master_code, guess, turn, LAST_TURN)

      show_guess_with_hint(guess, @master_code)
      turn += 1
    end
    show_end_message(turn, guess)
  end

  def show_end_message(turn, guess)
    puts "\n"
    if turn == LAST_TURN || %w[q Q].include?(guess)
      show_code(guess) if turn == LAST_TURN
      puts game_over_message
      reveal_code(@master_code)
    else
      show_code(guess)
      show_win_message
    end
  end
end
