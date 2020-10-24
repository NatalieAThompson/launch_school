# Build a program that displays when the user will retire and how many years she has to work till retirement.

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

puts "What is your age?"
age = gets.chomp.to_i

puts "What age would you like to retire?"
retirement_age = gets.chomp.to_i

current_year = Time.now.year
years_til_retirement = retirement_age - age
retirement_year = current_year + years_til_retirement

puts sprintf("It's %i. You will retire in %i", current_year, retirement_year)
puts sprintf("You have only %i years of work to go!", years_til_retirement)