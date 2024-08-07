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
    "\nThe computer has set the '#{style_text('master code', 'bold')}' and now it’s time for you to break the code.\n\n"
  end

  def show_turn(turn)
    puts "#{colorize_text("Turn ##{turn}:", 'bright_yellow')} Type in four numbers (1-6) to guess code, or q to quit game."
  end

  def show_win_message
    puts colorize_text("\nYou broke the code! Congratulations, you win! （づ￣3￣）づ╭❤️～\n", 'bright_green')
  end

  def reveal_code(master_code)
    puts "Here is the '#{style_text('master code', 'italic')}' that you were trying to break:\n\n"
    master_code.each_char { |char| print colorize_bg(char) }
    puts "\n\n"
  end

  def last_turn_warning
    style_text(colorize_text('Choose carefully. This is your last chance to win!', 'red'),
               'blink')
  end

  def game_over_message
    "\n\e[95mGame over. That was a hard code to break! ¯\\_(ツ)_/¯\e[0m\n\n"
  end

  def show_guess_with_hint(guess)
    hints = generate_hints(guess)
    guess.each_char { |char| print colorize_bg(char) }
    print ' Hints: '
    hints.each { |hint| print hint_notation(hint) }
    puts ''
  end

  def hint_notation(hint)
    {
      '*' => "\e[91m\u25CF\e[0m ",
      '?' => "\e[37m\u25CB\e[0m "
    }[hint]
  end

  def show_code(guess)
    guess.each_char { |char| print colorize_bg(char) }
    puts ''
  end
end
