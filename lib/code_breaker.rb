# if user opt to be code breaker
class CodeBreaker
  attr_accessor :master_code

  include Display
  LAST_TURN = 10
  def play
    @master_code = '1234'
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
      show_guess_with_hint(guess)
      break if game_over?(turn, guess)

      turn += 1
    end
    show_end_message(turn, guess)
  end

  def game_over?(turn, guess)
    turn == LAST_TURN || guess == @master_code || %w[q Q].include?(guess)
  end

  def show_end_message(turn, guess)
    if turn == LAST_TURN || %w[q Q].include?(guess)
      puts game_over_message
      reveal_code(@master_code)
    else
      show_win_message
    end
  end

  def exact_guesses(guess)
    exact_match = 0
    @master_code.chars.each_with_index do |char, index|
      exact_match += 1 if char == guess[index]
    end
    exact_match
  end

  def correct_guesses(guess)
    exact = exact_guesses(guess)
    guess = guess.chars
    i = 0
    @master_code.include?(guess[i]) ? guess.delete_at(i) : i += 1 while i < guess.length

    4 - guess.length - exact
  end
end
