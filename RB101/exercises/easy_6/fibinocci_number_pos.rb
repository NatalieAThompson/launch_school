# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, 
# and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. 
# For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, 
# especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. 
# (The first Fibonacci number has index 1.)\

def find_fibonacci_index_by_length(length)
  fib_start = [1, 1]
  counter = 3
  sum = fib_start.sum

  until sum.to_s.length >= length
    counter += 1
    fib_start[0], fib_start[1] = fib_start[1], sum
    sum = fib_start.sum
  end

  counter
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
# You may assume that the argument is always greater than or equal to 2.

=begin
input: integer
output: interger
-Fibonacci is a series of numbers
  -start with 1, 1 then numbers after that are the 2 numbers right before in the sequence added together
-Looking for the index of the 1st number that has the passed in amount of digits

examples
2, (1 1 2 3 5 8 13)
-The indexes for the return starts at 1 not 0

Data Struct
integers, Arrays

Algorithm
Define a method find_fibonacci_index_by_length that takes in `length`
  -Initalize an array `fib_start` to [1, 1]
  -Create a counter equal to 3 (3 because the loop starts on the 3rd index of the array)
  -loop till the sum of `fib_start` has a length equal to `length`
    -On each loop
      - Find the sum of `fib_start`
      - add 1 to counter
      - update the positions of the `fib_start` array
        - index 0 equals index 1
        - index 1 equals sum
  -return the counter
=end