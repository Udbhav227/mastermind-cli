require_relative 'instructions'
require_relative 'formatting'

# class for all text related calls
module Display
  include Instructions
  include Formatting
  def show_instruction
    puts instruction
  end

  def set_game
    "The computer has set the '#{style_text('master code', 'bold')}' and now it’s time for you to break the code."
  end

  def show_turn(turn)
    puts "#{colorize_text("Turn ##{turn}:", 'bright_yellow')} Type in four numbers (1-6) to guess code, or q to quit game."
  end

  def show_win_message
    puts colorize_text('You broke the code! Congratulations, you win!', 'bright_red')
  end

  def reveal_code(master_code)
    puts "Here is the '#{style_text('master code', 'italic')}' that you were trying to break"
    master_code.each_char { |char| print colorize_bg(char) }
    puts ''
  end

  def last_turn_warning
    colorize_text('Choose carefully. This is your last chance to win!', 'bright_red')
  end

  def game_over_message
    "\e[95mGame over. That was a hard code to break! ¯\\_(ツ)_/¯\e[0m"
  end

  def show_guess_with_hint(guess)
    guess.each_char { |char| print colorize_bg(char) }
    exact_guesses(guess).times { print hint('*') }
    correct_guesses(guess).times { print hint('?') }
    puts ''
  end

  def hint(hint)
    {
      '*' => "\e[91m\u25CF\e[0m ",
      '?' => "\e[37m\u25CB\e[0m "
    }[hint]
  end
end
