# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. 
# You may assume that the argument will always be an odd integer.

def diamond(n)
  (1..n).each do |num|
    next if num % 2 == 0
    str = '*' * num
    puts str.center(n)
  end

  ar = Array(1...n).reverse
  ar.each do |num|
    next if num % 2 == 0
    str = '*' * num
    puts str.center(n)
  end
end

p diamond(1)

# *

p diamond(3)

#  *
# ***
#  *

p diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

=begin
input: integer
output: nil
-draw a dimond 
-the integer will always be odd
-the integer is the size of the squares length and width in character units
-All the lines are going to be the length of n
-there are going to be n number of rows

number to print = 1 
each loop increase by 2 until it is over n
then decrese by 2 til it is back at 1

probably use a loop in a loop
1..n.each do            1                 2
  1..n each do          1 2 3 4 5 6 7 8 9 row
    
Algorithm

=end