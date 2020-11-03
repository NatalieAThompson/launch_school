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
  #clear_screen
  puts "#{spots[0][0]}   |   #{spots[0][1]}   |   #{spots[0][2]}".center(24)
  puts '-'.center(24, '-')
  puts "#{spots[1][0]}   |   #{spots[1][1]}   |   #{spots[1][2]}".center(24)
  puts '-'.center(24, '-')
  puts "#{spots[2][0]}   |   #{spots[2][1]}   |   #{spots[2][2]}".center(24)
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

def marks_in_row?(spots, marker, marks_amount = 3) #marker is the player or computer marker
  #Returns true if someone won or if someone is close to winning.
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

def victory?(spots, marker)
  who_won(spots) == marker
end

def reveal_winner(spots, player_marker, computer_marker)
  if victory?(spots, player_marker)
    prompt "You won!"
  elsif victory?(spots, computer_marker)
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

def update_score_card!(spots, score_card, player_marker, computer_marker)
  if victory?(spots, player_marker)
    score_card[0] += 1
  elsif victory?(spots, computer_marker)
    score_card[1] += 1
  end
end

def players_turn!(spots, player_marker)
  player_choice = valid_int(only_avaliable_spots(spots))
  mark_spot(spots, player_choice, player_marker)
end

def defensive_spot_avalible?(spots, player_marker) 
  #player is about to win if any row has two player_markers
  #if any column has two player markers
  #if any diagonal has two player markers
  marks_in_row?(spots, player_marker, 2)
end

def find_defensive_spot(spots)
  #returns the number of the defensive_spot
  p "There is a defensive spot."
  only_avaliable_spots(spots).sample
end

def computer_turn!(spots, computer_marker, player_marker)
  #Lets add a functionallity where the computer marks a spot to block the player from winning
    #To do this we need to look at the win conditions and if two spots are filled by the player marker
      #The computer picks the 3rd spot.
  if defensive_spot_avalible?(spots, player_marker)
    computer_choice = find_defensive_spot(spots)
  else
    computer_choice = only_avaliable_spots(spots).sample
  end
  mark_spot(spots, computer_choice, computer_marker)
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
    display_spot_message(spots)
    
    players_turn!(spots, player_marker)
    break if winner_tie_check?(spots)

    computer_turn!(spots, computer_marker, player_marker)
    break if winner_tie_check?(spots)
  end

  display_board(spots)
  reveal_winner(spots, player_marker, computer_marker)
  update_score_card!(spots, score_card, player_marker, computer_marker)
  prompt sprintf("%s : %i, Computer : %i", username, score_card[0], score_card[1])

  
  if score_card.include?(5) || valid_end == 'N'
    clear_screen
    break
  end
end

score_card[0] == 5 ? prompt("You won the best of 5!") : prompt("You lost this set") if score_card.include?(5)  
prompt "Thanks for playing!"
