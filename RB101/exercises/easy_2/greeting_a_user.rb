# Write a program that will ask for user's name. The program will then greet the user. 
# If the user writes "name!" then the computer yells back to the user.

# What is your name? Bob
# Hello Bob.
# Copy Code
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

puts "What is your name?"
name = gets.chomp!

if name[-1] == '!'
  name.chop!
  puts sprintf("HELLO %s. WHY ARE WE SCREAMING?", name.upcase)
else
  puts sprintf("Hello %s", name)
end