# if user opt to be code breaker
class CodeBreaker
  attr_accessor :master_code

  include Display
  LAST_TURN = 10
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
      break if game_over?(turn, guess)

      show_guess_with_hint(guess)
      turn += 1
    end
    show_end_message(turn, guess)
  end

  def game_over?(turn, guess)
    turn == LAST_TURN || guess == @master_code || %w[q Q].include?(guess)
  end

  def show_end_message(turn, guess)
    if turn == LAST_TURN || %w[q Q].include?(guess)
      show_code(guess) if turn == LAST_TURN
      puts game_over_message
      reveal_code(@master_code)
    else
      show_code(guess)
      show_win_message
    end
  end

  def generate_hints(guess, master = @master_code)
    exact_matches = find_exact_matches(master, guess)
    partial_matches = find_partial_matches(master, guess)

    (['*'] * exact_matches) + (['?'] * partial_matches)
  end

  def find_exact_matches(master, guess)
    master.chars.zip(guess.chars).count { |m, g| m == g }
  end

  def find_partial_matches(master, guess)
    master_chars = master.chars
    guess_chars = guess.chars

    master_chars.each_with_index do |char, index|
      if char != guess_chars[index] && guess_chars.include?(char)
        guess_chars[guess_chars.index(char)] = nil
      end
    end

    guess_chars.count(&:nil?)
  end
end
