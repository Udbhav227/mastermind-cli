require_relative 'code_permutation'

# if user opt to play as code maker
class CodeMaker
  LAST_TURN = 10
  include Display
  include GameLogic
  def play
    permutation = Permutations.new
    puts "\nPlease enter a 4-digit 'master code' for the computer to break.\n"
    @master = user_input
    @all_hints = permutation.all_hints
    @all_answers = permutation.all_answers
    @possible_hints = @all_hints.dup
    @possible_answers = @all_answers.dup
    start_turns
  end

  def start_turns # rubocop:disable Metrics/MethodLength
    @turns = 1
    while @turns <= LAST_TURN
      sleep(0.4)
      show_turn(@turns, 'ai')
      sleep(1)
      @guess = make_guess
      next unless @all_answers.include?(@guess)

      @turns += 1
      @hint = generate_hints(@guess, @master).join
      show_guess_with_hint(@guess, @master)
      if @hint == '****'
        puts "\nGame over. The computer broke your code. (👉ﾟヮﾟ)👉\n\n"
        break
      end
    end
  end

  def make_guess # rubocop:disable Metrics/MethodLength,Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    if @turns > 1
      @possible_answers.keep_if do |answer|
        @all_hints[@guess][answer] == @hint
      end

      guesses = @possible_hints.map do |guess, hint_by_answer|
        hint_by_answer = hint_by_answer.select do |answer, _hint|
          @possible_answers.include?(answer)
        end
        @possible_hints[guess] = hint_by_answer

        hint_groups = hint_by_answer.values.group_by(&:itself)
        possiblity_counts = hint_groups.values.map(&:length)
        worst_case_possibilities = possiblity_counts.max
        impossible_guess = @possible_answers.include?(guess) ? 0 : 1
        [worst_case_possibilities, impossible_guess, guess]
      end

      guesses.min.last
    else
      '1122'
    end
  end

  def user_input
    input = gets.chomp
    unless input.match?(/^[1-6]{4}$/)
      puts 'Invalid code! Please enter a 4-digit code using numbers 1-6.'
    end
    input
  end
end
