require_relative 'display'

# game logic
module GameLogic
  def game_over?(master, guess, turn, last_turn)
    turn == last_turn || guess == master || %w[q Q].include?(guess)
  end

  def generate_hints(guessed_code, master_code) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
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
