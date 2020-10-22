# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.
def digit_list(num)
  num_list = []

  loop do
    num, remainder = num.divmod(10)
    num_list.unshift(remainder)
    break if num == 0
  end
  
  num_list
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

=begin
input: int
Output: array

algorithm
  Create a method `digit_list` that takes in `num`
    Create an empty array `num_list`
    Divide the number by 10 
      Add the remainder to the beginning of `num_list`
    Repeat line 16 till number is equal to 0
    return num_list
=end