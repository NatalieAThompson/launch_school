WINNING = { row: [1, 2, 3],
            row2: [4, 5, 6],
            row3: [7, 8, 9],
            column: [1, 4, 7],
            column1: [2, 5, 8],
            column2: [3, 6, 9],
            diag: [1, 5, 9],
            diag2: [3, 5, 7] }

FIRST = ['player', 'computer']

def joinor(spots, seperator = ',', connection = 'or')
  ar = spots.flatten
  last_num = ar.pop

  if ar.empty?
    last_num.to_s
  else
    ar.join(seperator + ' ') + ', ' + connection + ' ' + last_num.to_s
  end
end

def only_avaliable_spots(spots)
  spots.flatten.select { |num| num.is_a? Integer }
end

def prompt(str)
  puts "~> #{str}"
end

def marker_x_o(name)
  prompt "Hello #{name}, would you like to be O or X?"
  marker = ''
  loop do
    marker = gets.chomp.upcase

    break if marker == 'X' || marker == 'O'
    prompt "Please select X/O."
  end

  [marker, marker_comp(marker)]
end

def marker_comp(used_mark)
  used_mark == 'X' ? 'O' : 'X'
end

def colorizes(var)
  "\e[#{33}m#{var}\e[0m"
end

def create_colored_board(spots)
  spots.map {|sub_ar| sub_ar.map { |val| val.is_a?(Integer) ? val : colorizes(val) }}
end

# rubocop:disable Metrics/AbcSize
def display_board(spots)
  clear_screen
  spots = create_colored_board(spots)
  puts "  |       |   ".center(24)
  puts "   #{spots[0][0]}   |   #{spots[0][1]}   |   #{spots[0][2]}   ".center(24)
  puts "  |       |   ".center(24)
  puts '-'.center(24, '-')
  puts "  |       |   ".center(24)
  puts "   #{spots[1][0]}   |   #{spots[1][1]}   |   #{spots[1][2]}   ".center(24)
  puts "  |       |   ".center(24)
  puts '-'.center(24, '-')
  puts "  |       |   ".center(24)
  puts "   #{spots[2][0]}   |   #{spots[2][1]}   |   #{spots[2][2]}   ".center(24)
  puts "  |       |   ".center(24)
  puts
end
# rubocop:enable Metrics/AbcSize

def display_spot_message(spots)
  prompt "Please select a number to mark your spot!" 
  prompt "#{joinor(only_avaliable_spots(spots))}." 
end

def valid_int(spots_valid)
  loop do
    input = gets.chomp.to_i

    return input if spots_valid.include?(input)
    prompt "Please choose a vaild avaliable number."
  end
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

def winner?(spots)
  !!(won_in_row(spots) || won_in_column(spots) || won_diag(spots))
end

def marks_in_row?(spots, marker, marks_amount = 3)
  count = spots.map do |sub_ar|
    [sub_ar.count('X'), sub_ar.count('O')]
  end

  if marks_amount == 3
    if marker == 'X' && count.any? { |sub_ar| sub_ar[0] == 3 } ||
       marker == 'O' && count.any? { |sub_ar| sub_ar[1] == 3 }
      true
    end
  else 
    if marker == 'X' && count.any? { |sub_ar| sub_ar[0] == 2 } ||
       marker == 'O' && count.any? { |sub_ar| sub_ar[1] == 2 }
      true
    end
  end
end

def marks_in_column?(spots, marker, marks_amount = 3)
  spots = spots.transpose

  count = spots.map do |sub_ar|
    [sub_ar.count('X'), sub_ar.count('O')]
  end

  if marks_amount == 3
    if marker == 'X' && count.any? { |sub_ar| sub_ar[0] == 3 } ||
       marker == 'O' && count.any? { |sub_ar| sub_ar[1] == 3 }
      true
    end
  else 
    if marker == 'X' && count.any? { |sub_ar| sub_ar[0] == 2 } ||
       marker == 'O' && count.any? { |sub_ar| sub_ar[1] == 2 }
      true
    end
  end
end

def marks_diag?(spots, marker, marks_amount = 3)
  spots = [ 
          [spots[0][0], spots[1][1], spots[2][2]], 
          [spots[0][2], spots[1][1], spots[2][0]]
          ]
  
  count = spots.map do |sub_ar|
    [sub_ar.count('X'), sub_ar.count('O')]
  end

  if marks_amount == 3
    if marker == 'X' && count.any? { |sub_ar| sub_ar[0] == 3 } ||
        marker == 'O' && count.any? { |sub_ar| sub_ar[1] == 3 }
      true
    end
  else 
    if marker == 'X' && count.any? { |sub_ar| sub_ar[0] == 2 } ||
        marker == 'O' && count.any? { |sub_ar| sub_ar[1] == 2 }
      true
    end
  end
end

def won_in_row(spots)
  if marks_in_row?(spots, 'X')
    'X'
  elsif marks_in_row?(spots, 'O')
    'O'
  else
    false
  end
end

def won_in_column(spots)
  if marks_in_column?(spots, 'X')
    'X'
  elsif marks_in_column?(spots, 'O')
    'O'
  else
    false
  end
end

def won_diag(spots)
  if marks_diag?(spots, 'X')
    'X'
  elsif marks_diag?(spots, 'O')
    'O'
  else
    false
  end
end

def who_won(spots)
  if won_diag(spots)
    won_diag(spots)
  elsif won_in_column(spots)
    won_in_column(spots)
  elsif won_in_row(spots)
    won_in_row(spots)
  end
end
#Feel like there might be a better way to check for winning conditions than the 4 methods

def victory?(spots, marker)
  who_won(spots) == marker
end

def reveal_winner(spots)
  if victory?(spots, PLAYER_MARKER)
    prompt "You won!"
  elsif victory?(spots, COMPUTER_MARKER)
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

def clear_screen
  system("clear") || system("cls")
end

def winner_tie_check?(spots)
  winner?(spots) || only_avaliable_spots(spots).empty?
end

def mark_spot(spots, choice, marker)
  pos = mark_local(spots, choice)
  spots[pos[0]][pos[1].find_index(choice)] = marker
end

def valid_username()
  prompt "What should I call you?"
  loop do
    username = gets.chomp
    return username unless username.empty?
    prompt "Please type a username."
  end
end

def update_score_card!(spots, score_card)
  if victory?(spots, PLAYER_MARKER)
    score_card[0] += 1
  elsif victory?(spots, COMPUTER_MARKER)
    score_card[1] += 1
  end
end

def players_turn!(spots)
  player_choice = valid_int(only_avaliable_spots(spots))
  mark_spot(spots, player_choice, PLAYER_MARKER)
end

def defensive_spot_avalible?(spots, marker) 
  marks_in_row?(spots, marker, 2) || marks_in_column?(spots, marker, 2) || marks_diag?(spots, marker, 2)
end

def find_defensive_spot(spots, marker)
  #returns the number of the defensive_spot
  spots = spots.flatten
  WINNING.each do |_, value|
    temp_ar = value - only_avaliable_spots(spots)
    next unless temp_ar.length == 2 && spots[temp_ar[0]-1] == marker
    if spots[temp_ar[0]-1] == spots[temp_ar[1]-1]
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
  if find_defensive_spot(spots, COMPUTER_MARKER)
    computer_choice = find_defensive_spot(spots, COMPUTER_MARKER) 
  elsif find_defensive_spot(spots, PLAYER_MARKER)
    computer_choice = find_defensive_spot(spots, PLAYER_MARKER)
  elsif only_avaliable_spots(spots).include?(5)
    computer_choice = 5
  else
    computer_choice = only_avaliable_spots(spots).sample
  end
  mark_spot(spots, computer_choice, COMPUTER_MARKER)
end

def starting_board
  [ [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9] ]
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

def best_of_5?(score)
  score.include?(3)
end

## Main code ##

prompt "Welcome to Tic-Tac-Toe!"
username = valid_username
PLAYER_MARKER, COMPUTER_MARKER = marker_x_o(username)
score_card = [0, 0]

loop do
  spots = starting_board
  current_player = FIRST.sample

  loop do
    display_board(spots)
    display_spot_message(spots)

    place_piece!(spots, current_player)
    current_player = alternate_player(current_player)
    break if winner_tie_check?(spots)
  end

  display_board(spots)
  reveal_winner(spots)
  update_score_card!(spots, score_card)
  prompt sprintf("%s : %i, Computer : %i", username, score_card[0], score_card[1])

  
  if best_of_5?(score_card) || valid_end == 'N' 
    clear_screen
    break
  end
end

if best_of_5?(score_card)
  if score_card[0] > score_card[1] 
    prompt("You won the best of 5! With a score of: #{score_card}")
  else 
    prompt("You lost this set: #{score_card}")
  end
end
prompt "Thanks for playing!"

# Display screen at very end so you can see why you lost
