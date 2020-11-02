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
  loop do
    marker = gets.chomp.downcase

    return marker.upcase if marker == 'x' || marker == 'o'
    prompt "Please select X/O."
  end
end

def marker_comp(used_mark)
  used_mark == 'X' ? 'O' : 'X'
end

# rubocop:disable Metrics/AbcSize
def display_board(spots)
  clear_screen
  puts "#{spots[0][0]}   |   #{spots[0][1]}   |   #{spots[0][2]}".center(24)
  puts '-'.center(24, '-')
  puts "#{spots[1][0]}   |   #{spots[1][1]}   |   #{spots[1][2]}".center(24)
  puts '-'.center(24, '-')
  puts "#{spots[2][0]}   |   #{spots[2][1]}   |   #{spots[2][2]}".center(24)
  puts
end
# rubocop:enable Metrics/AbcSize

def select_spot_message(spots)
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

def won_in_row(spots)
  if spots.any? { |sub_ar| sub_ar.all? { |char| char == 'X' } }
    'X'
  elsif spots.any? { |sub_ar| sub_ar.all? { |char| char == 'O' } }
    'O'
  else
    false
  end
end

def won_in_column(spots)
  if spots.transpose.any? { |sub_ar| sub_ar.all? { |char| char == 'X' } }
    'X'
  elsif spots.transpose.any? { |sub_ar| sub_ar.all? { |char| char == 'O' } }
    'O'
  else
    false
  end
end

# Maybe seperate the true and false win to a different method and then calculate who_won with that?
def won_diag(spots)
  won = (spots[0][0] == spots[2][2] && spots[1][1] == spots[0][0]) ||
        (spots[0][2] == spots[2][0] && spots[1][1] == spots[0][2])

  if won && spots[1][1] == 'X'
    'X'
  elsif won && spots[1][1] == 'O'
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

def reveal_winner(spots, player_marker, computer_marker)
  if who_won(spots) == player_marker
    prompt "You won!"
  elsif who_won(spots) == computer_marker
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

prompt "Welcome to Tic-Tac-Toe!"
username = valid_username
player_marker = marker_x_o(username)
computer_marker = marker_comp(player_marker)
score_card = [0, 0]

loop do
  spots = [ [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9] ]

  loop do
    display_board(spots)
    select_spot_message(spots)
    
    player_choice = valid_int(only_avaliable_spots(spots))
    mark_spot(spots, player_choice, player_marker)
    break if winner_tie_check?(spots)

    computer_choice = only_avaliable_spots(spots).sample
    mark_spot(spots, computer_choice, computer_marker)
    break if winner_tie_check?(spots)
  end

  display_board(spots)
  reveal_winner(spots, player_marker, computer_marker)
  prompt "#{username} : 1, Computer : 1"

  
  if valid_end == 'N'
    clear_screen
    break
  end
end
