def marker_x_o
  loop do
    marker = gets.chomp.downcase

    if marker == 'x' || marker == 'o'
      return marker.upcase
    else
      puts "Please select X/O."
    end
  end
end

def marker_comp(used_mark)
  used_mark == 'X' ? 'O' : 'X'
end

# rubocop:disable Metrics/AbcSize
def display_board(spots)
  puts "#{spots[0][0]}   |   #{spots[0][1]}   |   #{spots[0][2]}".center(24)
  puts '-'.center(24, '-')
  puts "#{spots[1][0]}   |   #{spots[1][1]}   |   #{spots[1][2]}".center(24)
  puts '-'.center(24, '-')
  puts "#{spots[2][0]}   |   #{spots[2][1]}   |   #{spots[2][2]}".center(24)
  puts
end
# rubocop:enable Metrics/AbcSize

def valid_int(spots)
  input = ''
  loop do
    input = gets.chomp

    if input.to_i.to_s == input && spots.flatten.include?(input.to_i)
      break
    else
      puts "Please choose a vaild avaliable number."
    end
  end

  input.to_i
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
  won_in_row(spots) || won_in_column(spots) || won_diag(spots)
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

def reveal_winner(spots, player_marker, computer_marker)
  if who_won(spots) == player_marker
    puts "You won!"
  elsif who_won(spots) == computer_marker
    puts "The computer won"
  else
    puts "It's a tie!"
  end
end

def vaild_spot(spots)
  index = []
  loop do
    index = spots[Array(0..2).sample]
    break if index.any? { |char| char.is_a? Integer }
    p index
  end

  index.select { |num| num != 'X' && num != 'O' }.sample
end

def valid_end
  input = ''

  loop do
    input = gets.chomp

    if input.downcase == 'y' || input.downcase == 'n'
      break
    else
      puts "Please enter Y/N"
    end
  end

  input.upcase
end

def clear_screen
  system("clear") || system("cls")
end

def check_for_tie(spots)
  spots.all? do |sub_ar|
    sub_ar.all? do |num|
      num == 'X' || num == 'O'
    end
  end
end

def winner_tie_check?(spots)
  winner?(spots) || check_for_tie(spots)
end

def final_screen(spots)
  clear_screen
  display_board(spots)
end

puts "Welcome to Tic-Tac-Toe!"
puts "Would you like to be O or X?"

player_marker = marker_x_o
computer_marker = marker_comp(player_marker)

loop do
  spots = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
          ]

  loop do
    clear_screen
    display_board(spots)

    puts "Please select a number to mark your spot!"
    player_choice = valid_int(spots)
    spots[mark_local(spots, player_choice)[0]][mark_local(spots, player_choice)[1].find_index(player_choice)] = player_marker

    if winner_tie_check?(spots)
      final_screen(spots)
      break
    end

    computer_choice = vaild_spot(spots)
    spots[mark_local(spots, computer_choice)[0]][mark_local(spots, computer_choice)[1].find_index(computer_choice)] = computer_marker

    if winner_tie_check?(spots)
      final_screen(spots)
      break
    end
  end

  reveal_winner(spots, player_marker, computer_marker)

  puts "Would you like to play again? (Y/N)"
  if valid_end == 'N'
    clear_screen
    break
  end
end
