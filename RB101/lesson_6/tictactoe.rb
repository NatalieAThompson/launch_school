WINNING = { row: [1, 2, 3],
            row2: [4, 5, 6],
            row3: [7, 8, 9],
            column: [1, 4, 7],
            column1: [2, 5, 8],
            column2: [3, 6, 9],
            diag: [1, 5, 9],
            diag2: [3, 5, 7] }

## Display Methods ##
def clear_screen
  system("clear") || system("cls")
end

def joinor(spots, seperator = ',', connection = 'or')
  ar = spots.flatten
  last_num = ar.pop

  if ar.empty?
    last_num.to_s
  else
    ar.join(seperator + ' ') + ', ' + connection + ' ' + last_num.to_s
  end
end

def prompt(str)
  puts "~> #{str}"
end

def marker_x_o
  prompt "Hello #{USERNAME}, would you like to be O or X?"
  marker = ''
  loop do
    marker = gets.chomp.upcase

    break if marker == 'X' || marker == 'O'
    prompt "Please select X/O."
  end

  [marker, marker_comp(marker)]
end

def colorizes(var)
  "\e[33m#{var}\e[0m"
end

def create_colored_board(spots)
  spots.map do |sub_ar|
    sub_ar.map { |val| val.is_a?(Integer) ? val : colorizes(val) }
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(spots)
  # clear_screen
  spots = create_colored_board(spots)
  puts
  puts "  |       |   ".center(24)
  puts "   #{spots[0][0]}   |   #{spots[0][1]}   |   #{spots[0][2]}   "
  puts "  |       |   ".center(24)
  puts '-'.center(24, '-')
  puts "  |       |   ".center(24)
  puts "   #{spots[1][0]}   |   #{spots[1][1]}   |   #{spots[1][2]}   "
  puts "  |       |   ".center(24)
  puts '-'.center(24, '-')
  puts "  |       |   ".center(24)
  puts "   #{spots[2][0]}   |   #{spots[2][1]}   |   #{spots[2][2]}   "
  puts "  |       |   ".center(24)
  puts
end
# rubocop:enable Metrics/AbcSize

def display_spot_message(spots)
  prompt "Please select a number to mark your spot!"
  prompt "#{joinor(only_avaliable_spots(spots))}."
end

def reveal_winner(spots)
  if win(spots) == PLAYER_MARKER
    prompt "You won!"
  elsif win(spots) == COMPUTER_MARKER
    prompt "The computer won"
  else
    prompt "It's a tie!"
  end
end

def valid_end
  prompt "Try best of 5? (Y/N)"
  loop do
    input = gets.chomp.upcase

    return input if input == 'Y' || input == 'N'
    prompt "Please enter Y/N"
  end
end

def valid_username
  prompt "What should I call you?"
  loop do
    username = gets.chomp
    return username.capitalize unless username.empty?
    prompt "Please type a username."
  end
end

def valid_int(spots_valid)
  loop do
    input = gets.chomp.to_i

    return input if spots_valid.include?(input)
    prompt "Please choose a vaild avaliable number."
  end
end

def valid_player?
  prompt "Do you want to go first? (Y/N)"
  loop do
    choice = gets.chomp.upcase

    if choice == 'Y'
      return 'player'
    elsif choice == 'N'
      return 'computer'
    else
      prompt "Please select Y for yes or N for no."
    end
  end
end

def display_score(score)
  prompt format("%s : %i, Computer : %i", USERNAME, score[0], score[1])
end

def display_winner(score_card)
  if score_card[0] > score_card[1]
    prompt("You won the best of 5! With a score of: #{score_card}")
  else
    prompt("You lost this set: #{score_card}")
  end
end

def ending_screen(score)
  if score.include?(3)
    display_winner(score)
  end

  prompt "Thanks for playing!"
end

## Game Function ##
def only_avaliable_spots(spots)
  spots.flatten.select { |num| num.is_a? Integer }
end

def marker_comp(used_mark)
  used_mark == 'X' ? 'O' : 'X'
end

def mark_local(spots, choice)
  choice_idx = 0
  choice_ar = spots.select do |sub_ar|
    if sub_ar.include?(choice)
      choice_idx = spots.find_index(sub_ar)
    end

    sub_ar.include?(choice)
  end.flatten

  [choice_idx, choice_ar]
end

def check_matches?(marker, count, amount = 2)
  marker == 'X' && count.any? { |sub_ar| sub_ar[0] == amount } ||
    marker == 'O' && count.any? { |sub_ar| sub_ar[1] == amount }
end

def x_o_check(count, marker, marks_amount)
  if marks_amount == 3
    return true if check_matches?(marker, count, 3)
  elsif check_matches?(marker, count)
    return true
  end

  false
end

def x_o_amount(spots)
  spots.map do |sub_ar|
    [sub_ar.count('X'), sub_ar.count('O')]
  end
end

def marks_in_row?(spots, marker, marks_amount = 3)
  count = x_o_amount(spots)

  x_o_check(count, marker, marks_amount)
end

def marks_in_column?(spots, marker, marks_amount = 3)
  spots = spots.transpose
  count = x_o_amount(spots)

  x_o_check(count, marker, marks_amount)
end

def marks_diag?(spots, marker, marks_amount = 3)
  spots = [[spots[0][0], spots[1][1], spots[2][2]],
           [spots[0][2], spots[1][1], spots[2][0]]]

  count = x_o_amount(spots)

  x_o_check(count, marker, marks_amount)
end

def find_winner_marker?(spots, marker)
  marks_in_row?(spots, marker) ||
    marks_in_column?(spots, marker) ||
    marks_diag?(spots, marker)
end

def win(spots)
  if find_winner_marker?(spots, 'X')
    'X'
  elsif find_winner_marker?(spots, 'O')
    'O'
  else
    false
  end
end

def winner_tie_check?(spots)
  !!(win(spots) || only_avaliable_spots(spots).empty?)
end

def mark_spot!(spots, choice, marker)
  pos = mark_local(spots, choice)
  spots[pos[0]][pos[1].find_index(choice)] = marker
end

def update_score_card!(spots, score_card)
  if win(spots) == PLAYER_MARKER
    score_card[0] += 1
  elsif win(spots) == COMPUTER_MARKER
    score_card[1] += 1
  end
end

def players_turn!(spots)
  player_choice = valid_int(only_avaliable_spots(spots))
  mark_spot!(spots, player_choice, PLAYER_MARKER)
end

def defensive_spot_avalible?(spots, marker)
  marks_in_row?(spots, marker, 2) ||
    marks_in_column?(spots, marker, 2) ||
    marks_diag?(spots, marker, 2)
end

def find_defensive_spot(spots, marker)
  spots = spots.flatten
  WINNING.each do |_, value|
    temp_ar = value - only_avaliable_spots(spots)
    next unless temp_ar.length == 2 && spots[temp_ar[0] - 1] == marker
    if spots[temp_ar[0] - 1] == spots[temp_ar[1] - 1]
      value.each do |num|
        unless temp_ar.include?(num)
          return num
        end
      end
    end
  end
  false
end

def computer_turn!(spots)
  computer_choice = if find_defensive_spot(spots, COMPUTER_MARKER)
                      find_defensive_spot(spots, COMPUTER_MARKER)
                    elsif find_defensive_spot(spots, PLAYER_MARKER)
                      find_defensive_spot(spots, PLAYER_MARKER)
                    elsif only_avaliable_spots(spots).include?(5)
                      5
                    else
                      only_avaliable_spots(spots).sample
                    end
  mark_spot!(spots, computer_choice, COMPUTER_MARKER)
end

def starting_board
  [[1, 2, 3],
   [4, 5, 6],
   [7, 8, 9]]
end

def alternate_player(current)
  current == 'player' ? 'computer' : 'player'
end

def place_piece!(spots, turn)
  if turn == 'player'
    players_turn!(spots)
  else
    computer_turn!(spots)
  end
end

## Main code ##
prompt "Welcome to Tic-Tac-Toe!"
USERNAME = valid_username
PLAYER_MARKER, COMPUTER_MARKER = marker_x_o
score_card = [0, 0]
current_player = valid_player?

loop do
  spots = starting_board

  loop do
    clear_screen
    display_board(spots)
    display_spot_message(spots)

    place_piece!(spots, current_player)
    current_player = alternate_player(current_player)
    break if winner_tie_check?(spots)
  end

  clear_screen
  display_board(spots)
  reveal_winner(spots)
  update_score_card!(spots, score_card)
  display_score(score_card)

  if score_card.include?(3)
    clear_screen
    display_board(spots)
    break
  elsif valid_end == 'N'
    clear_screen
    break
  end
end

ending_screen(score_card)
