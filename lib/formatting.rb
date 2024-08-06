# cli text formatting
module Formatting
  def colorize_bg(number)
    {
      '1' => "\e[105m  1  \e[0m ",
      '2' => "\e[101m  2  \e[0m ",
      '3' => "\e[103m  3  \e[0m ",
      '4' => "\e[102m  4  \e[0m ",
      '5' => "\e[106m  5  \e[0m ",
      '6' => "\e[41m  6  \e[0m "
    }[number]
  end

  # rubocop:disable Layout/HashAlignment
  def colorize_text(text, color) # rubocop:disable Metrics/MethodLength
    # Define the hash of colors
    colors = {
      'black'         => "\e[30m",
      'red'           => "\e[31m",
      'green'         => "\e[32m",
      'yellow'        => "\e[33m",
      'blue'          => "\e[34m",
      'magenta'       => "\e[35m",
      'cyan'          => "\e[36m",
      'white'         => "\e[37m",
      'bright_black'  => "\e[90m",
      'bright_red'    => "\e[91m",
      'bright_green'  => "\e[92m",
      'bright_yellow' => "\e[93m",
      'bright_blue'   => "\e[94m",
      'bright_magenta' => "\e[95m",
      'bright_cyan'   => "\e[96m",
      'bright_white'  => "\e[97m",
      'reset'         => "\e[0m"
    }

    # Get the color code from the hash
    color_code = colors[color] || colors['reset']

    # Return the colorized text
    "#{color_code}#{text}#{colors['reset']}"
  end

  def style_text(text, attribute) # rubocop:disable Metrics/MethodLength
    attributes = {
      'bold'           => "\e[1m",
      'dim'            => "\e[2m",
      'italic'         => "\e[3m",
      'underline'      => "\e[4m",
      'blink'          => "\e[5m",
      'reverse'        => "\e[7m",
      'hidden'         => "\e[8m",
      'reset'          => "\e[0m"
    }

    # Get the attribute code from the hash
    attribute_code = attributes[attribute] || attributes['reset']

    # Return the text with the applied attribute
    "#{attribute_code}#{text}#{attributes['reset']}"
  end
end
# rubocop:enable Layout/HashAlignment
