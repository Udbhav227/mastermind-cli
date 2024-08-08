# Guesser AI
class Permutations
  attr_reader :all_answers, :all_hints

  include GameLogic
  def initialize # rubocop:disable Metrics/AbcSize
    puts "\nInitializing AI, please wait...\n"
    colors = '123456'.chars
    @all_answers = colors.product(*[colors] * 3).map(&:join)
    @all_hints = Hash.new { |h, k| h[k] = {} }

    @all_answers.product(@all_answers).each do |guess, master|
      @all_hints[guess][master] = generate_hints(guess, master).join
    end

    @all_answers = @all_answers.to_set
  end
end
