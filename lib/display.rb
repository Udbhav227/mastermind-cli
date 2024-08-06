require_relative 'instructions'

# class for all text related calls
module Display
  include Instructions
  def show_instruction
    puts instruction
  end

  def set_game
    'The computer has set the ‘master code’ and now it’s time for you to break the code.'
  end

  def show_turn(turn)
    puts "Turn ##{turn}: Type in four numbers (1-6) to guess code, or q to quit game."
  end

  def show_win_message
    puts 'You broke the code! Congratulations, you win!'
  end

  def reveal_code(master_code)
    puts "Here is the 'master code' that you were trying to break"
    puts master_code
  end

  def last_turn_warning
    'Choose carefully. This is your last chance to win!'
  end

  def game_over_message
    'Game over. That was a hard code to break! ¯\_(ツ)_/¯'
  end
end
