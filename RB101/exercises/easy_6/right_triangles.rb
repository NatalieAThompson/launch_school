# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. 
# The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, 
# and the other end at the upper-right.

def triangle(num)
  (num).times do |val|
    puts ('*' * (val+1)).rjust(num)
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

=begin
input: integer
output: nil
- prints the number of lines to the console = to the number passed in

Algorithm
-loop the number of times passed in
  -puts '*' * current number
  -Justify the element left the number of spaces equal to the passed in number.
=end