# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations == 5
#   iterations += 1
# end

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer = 'yes'
# end

# numbers = []

# while numbers.length < 5
#   numbers << Array(0..99).sample
# end

# puts numbers

# count = 1

# until count == 11
#   puts count
#   count += 1
# end

# numbers = [7, 9, 13, 25, 18]
# count = 0
# until count == numbers.length
#   puts numbers[count]
#   count += 1
# end

# for i in 1..100
#   puts i if i % 2 != 0
# end

# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# for name in friends
#   p sprintf("Hello, %s!", name)
# end

# count = 1

# loop do
#   p sprintf("%d is %s", count, count.odd? ? "odd" : "even")
#   count += 1
#   break if count == 6
# end

# loop do
#   number = rand(100)
#   puts number
#   break if number >= 0 && number <= 10
# end

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i

#   break if answer == 4
#   puts "That is wrong. Try again"
# end

# puts "That's correct"

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input

#   break if numbers.length == 5
# end
# puts numbers

# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   p names.shift

#   break if names.length == 0
# end

# 5.times do |index|
#   p index
#   break if index == 2
# end

# 5.times do |index|
#   puts index
#   break if index == 4
# end

# 5.times do |index|
#   puts index
#   break if index < 7
# end

# number = 0

# until number == 10
#   number += 2
#   puts number
# end

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)

#   next if number_a != 5 && number_b !=5
#   puts sprintf("%s is 5", number_a == 5 ? 'number_a' : 'number_b')
#   break
# end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
