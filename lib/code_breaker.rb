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

  def generate_hints(guessed_code, master_code = @master_code) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    exact_matches = 0
    guessed_code_counts = Hash.new(0)
    master_code_counts = Hash.new(0)

    guessed_code.chars.each_with_index do |char, i|
      if char == master_code[i]
        exact_matches += 1
      else
        guessed_code_counts[char] += 1
        master_code_counts[master_code[i]] += 1
      end
    end

    partial_matches = 0
    guessed_code_counts.each do |char, count|
      partial_matches += [count, master_code_counts[char]].min if master_code_counts.key?(char)
    end

    (['*'] * exact_matches) + (['?'] * partial_matches)
  end
end
