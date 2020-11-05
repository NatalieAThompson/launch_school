# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
# Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(num1, num2)
  ar = []

  num1.upto(num2) do |value|
    if value % 5 == 0 && value % 3 == 0
      ar << "FizzBuzz"
    elsif value % 5 == 0
      ar << "Buzz"
    elsif value % 3 == 0
      ar << "Fizz"
    else
      ar << value
    end
  end

  puts ar.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

=begin
input: 2 integers
output: nil
- print out things in the method
- print all numbers between the 2 given
  - if the number is divisible by 3 
    - print "Fizz" instead
  - if the number is divisible by 5
    - print "Buzz" instead
  - if the number is divisible by both 3 and 5
    - print "FizzBuzz" instead

Algorithm
Initalize an empty ar
loop from the 1st to the 2nd number
  check the current number
    if it is divisible by 3 and 5 
      add "FizzBuzz" to the ar
    if it is divisible by 5
      add "Buzz" to the ar
    if it is divisible by 3
      add "Fizz" to the ar
    else
      add current number to the ar
Join the ar and print it to screen
=end