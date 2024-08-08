# rubocop:disable Metrics/AbcSize

# Instructions on how to play the game
module Instructions
  def instruction
    <<~HEREDOC

      #{style_text('How to play Mastermind:', 'underline')}

      This is a 1-player game against the computer.
      You can chose to be code #{style_text('MAKER', 'underline')} or the code #{style_text('BREAKER', 'underline')}.

      There are six different number/color combinations:

      #{colorize_bg('1')}#{colorize_bg('2')}#{colorize_bg('3')}#{colorize_bg('4')}#{colorize_bg('5')}#{colorize_bg('6')}

      The code maker will choose four to create a 'master code'. For example,

      #{colorize_bg('1')}#{colorize_bg('3')}#{colorize_bg('4')}#{colorize_bg('1')}

      As you can see, there can be #{colorize_text('more than one', 'red')} of same number/color.
      In order to  win, the code breaker needs to guess the 'master code; is 10 or less turns.

      #{style_text('Hints:', 'underline')}

      After each guess, there will be up to four hints to help crack the code.

        #{hint_notation('*')} This hint means you have 1 correct number in the correct location.
        #{hint_notation('?')} This hint means you have 1 correct number, but in the wrong location.

      #{style_text('Clue Example:', 'underline')}

      To continue the example, using the above 'master code' a guess of "#{colorize_text('1', 'bright_magenta')}#{colorize_text('4', 'bright_green')}#{colorize_text('6', 'red')}#{colorize_text('3', 'bright_yellow')}" would produce 3 Hints:

      #{colorize_bg('1')}#{colorize_bg('4')}#{colorize_bg('6')}#{colorize_bg('3')}  Hints: \e[91m\u25CF\e[0m \e[37m\u25CB\e[0m \e[37m\u25CB\e[0m

      The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.

      #{style_text("It's time to play!", 'underline')}

      Would you like to be the code MAKER or code BREAKER?

      => Press '1' to be the code MAKER
      => Press '2' to be the code BREAKER
    HEREDOC
  end
end

# rubocop:enable Metrics/AbcSize
