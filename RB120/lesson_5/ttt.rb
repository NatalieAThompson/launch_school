module Messageable
  def prompt(message)
    puts "~> #{message}"
  end
end

module Clearable
  def clear_screen
    system("clear") || system("cls")
  end
end

class Player
  attr_reader :marker

  def initialize
    @marker = Marker.new
  end
end

class Computer < Player
  def initialize
    super
    @name = %w('ZingBot ClapTrap Toaster Baymax Nirvash').sample
  end

  def pick_marker
    marker.symbol = 'X'
    marker.color = Marker::COLORS.keys.sample
  end

  def pick_spot(board)
    location = board.avaliable_spots.sample

    board.mark_spot(marker, location)
  end
end

class Human < Player
  include Messageable

  attr_writer :name

  def pick_color
    prompt "What color would you like to represent you?"
    prompt "Please select from this list #{Marker.display_colors}."
    marker.color = valid_color
  end

  def pick_name
    prompt "What would you like to be called?"
    self.name = valid_name
  end

  def pick_marker
    prompt "Pick a letter or symbol to represent you!"
    marker.symbol = valid_marker
  end 

  def valid_name
    loop do
      input = gets.chomp.capitalize
      break input unless input.empty? || input.squeeze == " "
      prompt "Sorry that isn't a valid name."
    end
  end

  def valid_marker
    loop do
      input = gets.chomp
      break input unless input.length != 1 || input.squeeze == " " || ('0'..'9').to_a.include?(input)
      prompt "Please pick a letter or symbol" #Maybe use ord values and make an array of vaild characters
    end
  end

  def valid_color
    loop do
      input = gets.chomp.downcase
      break input if Marker::COLORS.keys.include?(input.to_sym)
      prompt "Please pick an avaliable color: #{Marker.display_colors}"
    end
  end

  def pick_spot(board)
    input = nil
    loop do
      prompt "Choose an avaliable spot."
      input = gets.chomp
      break if board.avaliable_spots.include?(input)
      prompt "Sorry that isn't an avaliable spot."
    end

    board.mark_spot(marker, input)
  end
end

class Board
  include Clearable

  def initialize(num)
    @length = num
    @layout = []

    num.times do 
      @layout << Array.new(num)
    end

    count = 1

    @layout.map! do |sub_ar|
      sub_ar.map! do |ele|
        ele = count
        count += 1
        (0..9).include?(ele) ? "#{ele} " : ele.to_s
      end
    end
  end

  def avaliable_spots
    @layout.flatten.select { |ele| ele.to_i.to_s == ele.strip }.map! { |ele| ele.to_i.to_s }
  end

  def mark_spot(mark, location)
    @layout.each.with_index do |sub_ar, index|
      sub_ar.each.with_index do |ele, index2|
        @layout[index][index2] = mark if ele.to_i == location.to_i
      end
    end
  end

  def blank_row
    str = ''
    (@length - 1).times do
      str << (' ' * 7) + '|'
    end
    str << (' ' * 7)
  end

  def dashed_row
    amount = (7 * @length) + (@length - 1)

    '-'.center(amount, '-')
  end

  def marked_row(row_num)
    str = ''
    index = 0
    (@length - 1).times do
      str << (' ' * 3) + @layout[row_num][index].to_s + (' ' * 2) + '|'
      index += 1
    end
    str << (' ' * 3) + @layout[row_num][index].to_s + (' ' * 2)
  end

  def winning_row?
    @layout.any? do |sub_ar|
      sub_ar.all? do |ele|
        Marker === ele && ele.symbol == sub_ar[0].symbol
      end
    end
  end

  def to_s
    clear_screen
    puts
    (@length - 1).times do |index|
      puts blank_row
      puts marked_row(index)
      puts blank_row
      puts dashed_row
    end
    puts blank_row
    puts marked_row(@length - 1)
    puts blank_row
    puts
  end

  private
  attr_reader :layout
end

class Marker
  attr_reader :symbol, :color

  COLORS = { red: 31,
             green: 32,
             yellow: 33,
             magenta: 35,
             cyan: 36 }

  def self.display_colors
    COLORS.keys.join(", ")
  end

  def color=(v)
    @color = v.downcase.to_sym
  end

  def symbol=(char)
    @symbol = char.upcase
  end

  def to_s
    "\e[#{COLORS[color]}m#{symbol}\e[0m "
  end

  def to_i
    "0"
  end

  def strip
    symbol.strip
  end
end

class TTTGame
  include Messageable
  include Clearable

  attr_reader :human, :computer, :board

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      loop do
        board.to_s
        human.pick_spot(board)
        board.to_s
        computer.pick_spot(board)
        board.to_s
        # break if winning_mark?
        break if board.winning_row? #add the other win conditions
      end
      board.to_s
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  def display_welcome_message
    clear_screen
    prompt "Welcome to Tic-Tac-Toe!"
    human.pick_name
    human.pick_marker
    human.pick_color
    computer.pick_marker #Temp values
    display_rules
  end

  def display_rules # Add validation at some point
    clear_screen
    prompt "A normal game of Tic-Tac-Toe is played on a 3x3 board."
    prompt "The first person to get 3 in a row wins."
    prompt "Would you like to play with normal rules or pick a custom board size?"
    input = gets.chomp
    if input == "normal" || input == "n"
      @board = Board.new(3)
    elsif input == "custom" || input == "c"
      prompt "What size would you like the board? Pick a number between 3 & 8."
      size = gets.chomp.to_i
      @board = Board.new(size)
    end
  end
end

TTTGame.new.play