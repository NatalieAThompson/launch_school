# Fibonacci Numbers (Procedural)
# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. 
# In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow 
# and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, 
# the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. 
# (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(n)
  sequence = [1, 1]

  (n-1).times do
    sum = sequence.sum
    sequence[0] = sequence[1]
    sequence[1] = sum
  end

  sequence[0]
end
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

=begin
input: integer
output: integer
-1, 1, 2, 3, 5, 8, 13 ...
input number is place in sequence

Algorithm
-Create an array to start the sequence [1, 1]
-loop the number of times input - 1
  find the sum of the numbers in the array
  put the 1st index number in the 0 index
  put the sum in the second index
return the first index of the array
=end