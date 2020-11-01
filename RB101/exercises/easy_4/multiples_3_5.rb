# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, 
# and then computes the sum of those multiples. For instance, if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

def multisum(num)
  multiples = []

  (1..num).each do |number|
    if number % 3 == 0 || number % 5 == 0
      multiples << number
    end
  end

  multiples.sum
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

=begin
input: integer
output: integer
- passed in num is the end number for a range (1 to num)
- Check if a number is a mutiple of 3 or 5
  -What is a mutiple?
    -multiple is any number evenly divided by 3 or 5
- return the sum of the multiples

Data Struct
integers, Array

Algorithm
- Initalize an empty array called `multiples`
- loop through a range from 1 to `num`
  - if the number is evenly divisible by 3 or 5 add that number to `multiples`
- Sum the numbers in `multiples`
=end