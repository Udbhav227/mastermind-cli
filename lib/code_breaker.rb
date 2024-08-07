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
    master_counts = Hash.new(0)
    guess_counts = Hash.new(0)
    
    master.chars.each { |char| master_counts[char] += 1 }
    guess.chars.each { |char| guess_counts[char] += 1 }
  
    partial_matches = 0
    master_counts.each do |char, count|
      partial_matches += [count, guess_counts[char]].min if char != guess_counts[char]
    end
  
    partial_matches
  end
end
