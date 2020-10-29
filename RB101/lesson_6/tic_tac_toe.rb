def display_board(spots)
  puts "#{spots[0][0]}   |   #{spots[0][1]}   |   #{spots[0][2]}".center(24)
  puts '-'.center(24,'-')
  puts "#{spots[1][0]}   |   #{spots[1][1]}   |   #{spots[1][2]}".center(24)
  puts '-'.center(24,'-')
  puts "#{spots[2][0]}   |   #{spots[2][1]}   |   #{spots[2][2]}".center(24)
  puts
end

def valid_int()
  input = ''
  loop do
    input = gets.chomp

    if input.to_i.to_s == input
      break
    else
      puts "Please choose a vaild avaliable number."
    end
  end

  input.to_i
end

def winner?(spots)
  won_in_row(spots) || won_in_column(spots) || won_diag(spots)
end

def won_in_row(spots)
  if spots.any? { |sub_ar| sub_ar.all? { |char| char == 'X' }}
    who = 'X'
  elsif spots.any? { |sub_ar| sub_ar.all? { |char| char == 'O' }}
    who = 'O'
  else
    who = false
  end
end

def won_in_column(spots)
  if spots.transpose.any? { |sub_ar| sub_ar.all? { |char| char == 'X' }}
    who = 'X'
  elsif spots.transpose.any? { |sub_ar| sub_ar.all? { |char| char == 'O' }}
    who = 'O'
  else
    who = false
  end
end

def won_diag(spots)
  won = (spots[0][0] == spots[2][2] || spots[0][2] == spots[2][0]) && (spots[1][1] == spots[0][0] || spots[1][1] == spots[0][2])
  # This logic doesn't work because it counts X,X,O as true

  if won && spots[1][1] == 'X'
    who = 'X'
  elsif won && spots[1][1] =='O'
    who = 'O'
  else
    who = false
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

def valid_end()
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

puts "Welcome to Tic-Tac-Toe!"
#puts "Would you like to be O or X?"
#Lets default computer to O and player to X for now.

loop do
  spots = [
          [1, 2, 3], 
          [4, 5, 6], 
          [7, 8, 9]
        ]

  loop do
    display_board(spots)

    break if spots.all? { |num| num == 'X' || num == 'O' }
    #Ask if play again.

    puts "Please select a number to mark your spot!"
    input = valid_int()
    input_idx = 0
    input_ar = spots.select do |sub_ar| 
      if sub_ar.include?(input) 
        input_idx = spots.find_index(sub_ar)
      end

      sub_ar.include?(input)
    end.flatten

    spots[input_idx][input_ar.find_index(input)] = 'X'

    if winner?(spots)
      display_board(spots)
      break
    end

    computer_choice = spots[Array(0..2).sample].select {|num| num != 'X' && num != 'O' }.sample
    computer_idx = 0
    computer_ar = spots.select do |sub_ar| 
      if sub_ar.include?(computer_choice) 
        computer_idx = spots.find_index(sub_ar)
      end
      sub_ar.include?(computer_choice) 
    end.flatten
  
    spots[computer_idx][computer_ar.find_index(computer_choice)] = 'O'
  end

  if who_won(spots) == 'X'
    puts "You won!"
  elsif who_won(spots) == 'O'
    puts "The computer won"
  else
    puts "It's a tie!"
  end

  puts "Would you like to play again? (Y/N)"
  break if valid_end == 'N'
end
