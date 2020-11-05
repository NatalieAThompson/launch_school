# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number 
# of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

def show_multiplicative_average(ar)
  product = ar.reduce(&:*)
  average = product.to_f / ar.length
  
  puts sprintf('The result is %.03f', average)
end


show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

=begin
input: array
output: nil
-mutiply all the numbers in the given array
-divide the result by the length of the array
-return the result as float rounded to 3 decimal places
  - The return value should be a string

Algorithm
Initalize product to the product of the array
Initalize average to the product divided by the array's length
print the string "The result is " with average rounded at the end
=end