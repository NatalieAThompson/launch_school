# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

# Copy Code
# repeat('Hello', 3)

=begin
input: string, int
output: nil (side effect: prints string)

Create a method `repeat` that takes `str` and `num`
  loop `num` of times
    print out the string
=end

def repeat(str, num)
  num.times do
    puts str
  end
end

repeat('Hello', 3)