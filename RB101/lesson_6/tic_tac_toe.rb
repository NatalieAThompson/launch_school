puts "Welcome to Tic-Tac-Toe!"
puts "Would you like to be O or X?"
#Lets default computer to O and player to X for now.

spots = [
          [1, 2, 3], 
          [4, 5, 6], 
          [7, 8, 9]
        ]

#write a loop that checks if the 01 11 23 match or 02 11 20

loop do
  puts "#{spots[0][0]}   |   #{spots[0][1]}   |   #{spots[0][2]}".center(24)
  puts '-'.center(24,'-')
  puts "#{spots[1][0]}   |   #{spots[1][1]}   |   #{spots[1][2]}".center(24)
  puts '-'.center(24,'-')
  puts "#{spots[2][0]}   |   #{spots[2][1]}   |   #{spots[2][2]}".center(24)
  puts

  break if spots.all? { |num| num == 'X' || num == 'O' }
  p "You win!" if spots.any? { |sub_ar| sub_ar.all? { |char| char == 'X' }}
  p "You win!" if spots.transpose.any? { |sub_ar| sub_ar.all? { |char| char == 'X' }}
  p "You win!" if (spots[0][0] == spots[2][2] || spots[0][2] == spots[2][0]) && (spots[1][1] == spots[0][0] || spots[1][1] == spots[0][2])

  puts "Please select a number to mark your spot!"
  input = gets.chomp.to_i
  input_idx = 0
  input_ar = spots.select do |sub_ar| 
    if sub_ar.include?(input) 
      input_idx = spots.find_index(sub_ar)
    end

    sub_ar.include?(input)
  end.flatten

  computer_choice = spots[Array(0..2).sample].select {|num| num != 'X' && num != 'O' }.sample
  computer_idx = 0
  computer_ar = spots.select do |sub_ar| 
    if sub_ar.include?(computer_choice) 
      computer_idx = spots.find_index(sub_ar)
    end
    sub_ar.include?(computer_choice) 
  end.flatten

  p input_ar.find_index(input)
  p computer_ar.find_index(computer_choice)
  spots[input_idx][input_ar.find_index(input)] = 'X'
  spots[computer_idx][computer_ar.find_index(computer_choice)] = 'O'
end