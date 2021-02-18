module Messageable
  def prompt(message)
    puts "~> #{message}"
  end
end

module Clearable
  def clear_screen
    system('clear') || system('cls')
  end
end

class Player
  attr_reader :marker, :name
  attr_accessor :moves, :score

  def initialize
    @marker = Marker.new
    @moves = []
    @score = 0
  end

  private

  attr_writer :name
end

class Computer < Player
  def initialize
    super
    @name = %w(ZingBot ClapTrap Toaster Baymax Nirvash).sample
    marker.symbol = @name[0]
  end

  def pick_marker
    marker.color = Marker.avaliable_colors.sample.to_s
  end

  def pick_spot(board)
    picked_moves = opponents_moves(board)
    location = location_selection(board, picked_moves)
    record_spot!(location)
    board.mark_spot(marker, location)
  end

  private

  def picking_avaliable_spot?(board)
    board.avaliable_spots.include?(board.center_spot.to_s)
  end

  def opponents_moves(board)
    (board.start - board.avaliable_spots_as_ints) - moves
  end

  def record_spot!(location)
    @moves << location.to_i
  end

  def middle_avaliable?(board)
    board.odd? && picking_avaliable_spot?(board)
  end

  def location_selection(board, picked_moves)
    if middle_avaliable?(board)
      board.center_spot
    elsif winning_spot?(moves, board.avaliable_spots)
      winning_spot(moves, board.avaliable_spots)
    elsif winning_spot?(picked_moves, board.avaliable_spots)
      winning_spot(picked_moves, board.avaliable_spots)
    else
      board.avaliable_spots.sample
    end
  end

  def avaliable_move?(arr, moves, avaliable_spots)
    avaliable_spots.include?((arr - moves)[0].to_s)
  end

  def winning_move?(arr, moves)
    (arr - moves).length == 1
  end

  def qualify_winning_spot?(arr, moves, spots)
    winning_move?(arr, moves) && avaliable_move?(arr, moves, spots)
  end

  def winning_spot(curr_moves, avaliable_spots)
    spot = TTTGame.winning_combos.select do |sub_ar|
      qualify_winning_spot?(sub_ar, curr_moves, avaliable_spots)
    end

    (spot[0] - curr_moves)[0]
  end

  def winning_spot?(curr_moves, avaliable_spots)
    TTTGame.winning_combos.any? do |sub_ar|
      qualify_winning_spot?(sub_ar, curr_moves, avaliable_spots)
    end
  end
end

class Human < Player
  include Messageable

  def pick_color
    prompt "Next, what color do you like?"
    prompt "Please select from this list #{Marker.display_colors}."
    marker.color = valid_color
    Marker.avaliable_colors.delete(marker.color)
  end

  def pick_name
    prompt "What would you like to be called?"
    self.name = valid_name
  end

  def pick_marker
    prompt "Pick a letter or symbol to represent you!"
    marker.symbol = valid_marker
  end

  def pick_spot(board)
    input = nil
    loop do
      prompt "Choose an avaliable spot."
      input = gets.chomp
      break if board.avaliable_spots.include?(input)
      prompt "Sorry that isn't an avaliable spot."
    end
    @moves << input.to_i
    board.mark_spot(marker, input)
  end

  private

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
      break input unless input.length != 1 ||
                         input.squeeze == " " ||
                         ('0'..'9').to_a.include?(input)
      prompt "Please pick a letter or symbol"
    end
  end

  def valid_color
    loop do
      input = gets.chomp.downcase
      break input if marker_includes?(input)
      if match_first_letter?(input)
        break select_first_letter(input)
      end
      color_not_valid_message
    end
  end

  def marker_includes?(input)
    Marker.avaliable_colors.include?(input.to_sym)
  end

  def match_first_letter?(input)
    Marker.avaliable_colors.map { |sym| sym.to_s[0] }.include?(input.downcase)
  end

  def select_first_letter(input)
    Marker.avaliable_colors.select do |sym|
      sym.to_s.start_with?(input.downcase)
    end[0]
  end

  def color_not_valid_message
    prompt "Please select a color: #{Marker.avaliable_colors.join(', ')}"
  end
end

class Board
  include Clearable

  attr_reader :length

  def initialize(num = 3)
    @length = num
    self.layout = length
  end

  def layout=(num)
    @layout = []
    add_empty_sub_arrays(num)
    fill_empty_array_with_numbers
    self.length = num unless num == length
  end

  def avaliable_spots
    spots = @layout.flatten
    spots.select! { |ele| ele.to_i.to_s == ele.strip }
    spots.map! { |ele| ele.to_i.to_s }
  end

  def avaliable_spots_as_ints
    avaliable_spots.map(&:to_i)
  end

  def mark_spot(mark, location)
    @layout.each.with_index do |sub_ar, index|
      sub_ar.each.with_index do |ele, index2|
        @layout[index][index2] = mark if ele.to_i == location.to_i
      end
    end
  end

  def odd?
    length.odd?
  end

  def center_spot
    ((length**2) / 2) + 1
  end

  def start
    Array(1..length**2)
  end

  def to_s
    clear_screen
    display
    ""
  end

  private

  attr_reader :layout

  def format_as_string(ele)
    (0..9).include?(ele) ? "#{ele} " : ele.to_s
  end

  def add_empty_sub_arrays(num)
    num.times do
      @layout << Array.new(num)
    end
  end

  def fill_empty_array_with_numbers
    count = 1
    @layout.map! do |sub_ar|
      sub_ar.map! do |_|
        ele = count
        count += 1
        format_as_string(ele)
      end
    end
  end

  def display
    puts
    (@length - 1).times do |index|
      blank_marked_blank_rows(index)
      puts dashed_row
    end
    blank_marked_blank_rows(@length - 1)
  end

  def blank_marked_blank_rows(size)
    puts blank_row
    puts marked_row(size)
    puts blank_row
  end

  def blank_row
    str = ''
    (@length - 1).times do
      str << "#{' ' * 7}|"
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
      str << "#{' ' * 3}#{@layout[row_num][index]}#{' ' * 2}|"
      index += 1
    end
    str << (' ' * 3) + @layout[row_num][index].to_s + (' ' * 2)
  end
end

class Marker
  attr_reader :symbol, :color

  COLORS = { red: 31,
             green: 32,
             yellow: 33,
             magenta: 35,
             cyan: 36 }

  @@avaliable_colors = COLORS.keys

  def self.avaliable_colors
    @@avaliable_colors
  end

  def self.display_colors
    avaliable_colors.join(", ")
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
    0
  end

  def strip
    symbol.strip
  end
end

class TTTGame
  include Messageable
  include Clearable

  @@winning_combos = []

  def self.winning_combos
    @@winning_combos
  end

  def initialize
    @human = Human.new
    @computer = Computer.new
    @current_player = human
  end

  def play
    display_welcome_message
    create_winning_combos
    game_play
    display_goodbye_message
  end

  private

  attr_reader :human, :computer
  attr_accessor :board

  # Display Methods

  def display_welcome_message
    clear_screen
    prompt "Welcome to Tic-Tac-Toe!"
    prompt "First player to 5 points wins!"
    set_preferences
  end

  def introduce_rival
    prompt "Hello #{human.name}. You'll be facing off against #{computer.name}."
    prompt rival_marker_selection
    human.pick_marker
  end

  def rival_marker_selection
    "#{computer.name} selected the letter #{computer.marker}to represent them."
  end

  def display_rules
    clear_screen
    prompt "A normal game of Tic-Tac-Toe is played on a 3x3 board."
    prompt "The first person to get 3 in a row gets a point."
    prompt "Play with (n)ormal rules or pick a (c)ustom board size?"
    self.board = valid_option
  end

  def display_round_winner
    if @winner == human
      prompt "#{human.name} got a point!"
    elsif @winner == computer
      prompt "#{computer.name} got a point!"
    else
      prompt "It was a tie!"
    end
  end

  def display_scores
    prompt "Current Score:"
    prompt vs_display
  end

  def vs_display
    "#{human.name}: #{human.score} vs #{computer.name}: #{computer.score}."
  end

  def continue
    prompt "Press any button to continue."
    gets.chomp
  end

  def display_winner
    if human.score == 5
      prompt "#{human.name} won!"
    else
      prompt "#{computer.name} won, better luck next time."
    end
  end

  def display_goodbye_message
    clear_screen
    prompt "Thank you for playing! I hope to see you again #{human.name}!"
  end

  # Helper Methods

  def set_preferences
    human.pick_name
    introduce_rival
    human.pick_color
    computer.pick_marker
    display_rules
  end

  # Functionallity Methods

  def valid_option
    loop do
      input = gets.chomp
      break Board.new if input == "normal" || input == "n"
      if input == "custom" || input == "c"
        prompt "What size would you like the board? Pick between 3 & 6."
        break Board.new(valid_board_size)
      end
      prompt "Please pick (n)ormal or (c)ustom."
    end
  end

  def valid_board_size
    loop do
      input = gets.chomp.to_i
      break input if (3..6).to_a.include?(input)
      prompt "Please select a number between 3 and 6."
    end
  end

  def create_winning_combos
    winning_columns
    winning_rows
    winning_diags
  end

  def winning_columns
    board.length.times do |index|
      counter = index + 1
      sub_ar = [counter]
      until sub_ar.length == board.length
        counter += board.length
        sub_ar << counter
      end
      @@winning_combos << sub_ar
    end
  end

  def winning_rows
    counter = 1

    until counter >= (board.length * board.length)
      sub_ar = [counter]
      until sub_ar.length == board.length
        counter += 1
        sub_ar << counter
      end
      counter += 1
      @@winning_combos << sub_ar
    end
  end

  def winning_diags
    plus = true
    [1, board.length].each do |ele|
      adding_diag_sub_ars(ele, plus)
      plus = false
    end
  end

  def adding_diag_sub_ars(ele, plus)
    sub_ar = [ele]
    adding_diag_sub_ar_elements(sub_ar, ele, plus)
    @@winning_combos << sub_ar
  end

  def adding_diag_sub_ar_elements(sub_ar, ele, plus)
    until sub_ar.length == board.length
      ele += (board.length + 1) if plus
      ele += (board.length - 1) unless plus
      sub_ar << ele
    end
  end

  def game_play
    loop do
      play_set
      display_winner
      break unless play_again?
    end
  end

  def play_set
    loop do
      reset
      play_round
      puts board
      display_round_winner
      update_scores
      display_scores
      break if human.score == 5 || computer.score == 5
      continue
    end
  end

  def reset
    board.layout = board.length
    human.moves = []
    computer.moves = []
    @winner = false
  end

  def play_round
    loop do
      current_player_moves
      break if won? || tie?
    end
  end

  def current_player_moves
    puts board
    @current_player.pick_spot(board)
    @current_player = @current_player == human ? computer : human
    puts board
  end

  def won?
    @@winning_combos.any? do |sub_ar|
      if sub_ar - human.moves == []
        @winner = human
      elsif sub_ar - computer.moves == []
        @winner = computer
      end
    end
  end

  def tie?
    board.avaliable_spots.empty?
  end

  def update_scores
    if @winner == human
      human.score += 1
    elsif @winner == computer
      computer.score += 1
    end
  end

  def play_again?
    input = nil
    loop do
      prompt "Would you like to play best of 5 again?"
      input = gets.chomp.downcase
      break if ['y', 'n', 'yes', 'no'].include?(input)
      prompt "Please choose (y)es or (n)o."
    end
    input[0] == 'y'
  end
end

TTTGame.new.play
