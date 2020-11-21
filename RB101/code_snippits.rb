def evaluation
  p "false"
end

if evaluation
  puts "True"
else
  puts "False"
end

####

a = 'Bob'

5.times do |x|
  puts x
  a = 'Bill'
end

p a

####

def is_even(x)
  if x % 2 == 0
    return true
  else
    return false
  end
end
 
is_even(99)

####
#In the following code, are a and b pointing to the same object?  Why?  What is the underlying concept?

a = 'Hello'
b = a
a = 'Goodbye'

# My solution
# a and b are not pointing to the same object. The local variable a is assigned to the string 'Hello'. 
# On line 2 the local variable b is assigned to point to the same object as a which is the string 'Hello'.  
# On line 3 a is reassigned, which changes the memory location, to 'Goodbye' but b is still pointing to the same memory location. 
# So a and b would not be pointing to the same object. The underlying concept in this code snippet is variables as pointers to locations in memory.

#Alfonso's solution
# a and b are pointing to different objects.  Even though on line 2 local variable b is initialized to the same 
# String object local variable a is referencing, a is reassigned on the last line of code to a new String object 
# Goodbye at which point b is still referencing Hello.
# This is an example of variables as pointers and the fact that variables act as pointers to physical spaces in memory.

####
#What does the following code outputs and why?  How can we make it outputs the opposite?

a = "Hello"
if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

#My Solution
# The following code returns nil but outputs "Hello is truthy". On line one local variable a is assigned to the string 'Hello'. 
# The string object a is referencing is passed into the if conditional on line 3 which evaluates to true. Line 4 runs calling the 
# puts method with a string argument that gets output but the return value of puts is nil. If we wanted "Hello is falsey" to be 
# output then a would need to be either false or nil to evaluate to false for the conditional based on the concept of truthiness. 
# If we wanted to return something that isn't nil we could use p instead of puts which would return the passed in object.

#Alfonso Answer
# The code outputs the String object "Hello is truthy"
# We first initialize the local variable a to the String "Hello". We then have a conditional statement that evaluates the truthiness 
# of a and outputs the String "Hello is truthy" if it does evaluate to true. In Ruby, every value apart from false and nil is truthy. 
# Since a is truthy (or evaluates to true in the context of the conditional statement) it outputs the String once it is passed into 
# the puts method as an argument.  One way of outputting "Hello is falsey" would be to change the value a is referencing so that it 
# evaluates to false.

####

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |n| puts n }

#My Answer
# The code snippet returns the object that arr is referencing, an array where each index is pointing to an integer [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]. 
# The return value is based on line 3. The each method will always return the collection it is called on. 
# The each method iterates through a collection using the do/end block passed in as an argument running for each element in the collection. 
# |n| is set by the current element of each as a block parameter. 
# So the output of this problem would be => "1 2 3 4 5 6 7 8 9 10" with each number on a separate line. 
# The method puts adds a line break after every call and the each method calls puts for each element.

#Alfonso's Answer
# The code returns the Array object [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] because of the return value of the each method.
# We first initialize the local variable arr to the Array object [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]. 
# We then invoke the each method on arr and pass it a curly braces {..} block as an argument with a parameter n. 
# Inside the block we invoke the puts method and pass n into it as an argument. 
# This will print the element being referenced by n inside the calling object on each iteration of the method and return nil. 
# However, since the each method ignores the return value, it will return the calling Array object arr is referencing.
# The each method performs iteration and executes the code within the block but ignores the blocks return value and returns the calling object.

def test(str)
  str  += '!' # str = str.+('!')
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str

# This problem demonstrates the concept of variable scope in that the code within `test` is scoped local only to the method and has no effect on `test_str` in the outer scope.

words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array

# This problem demonstrates the concept of transformation. `map` invokes the given block once for each element in the array on which it was called and each element is transformed based on the return value.

result = [1, 2, 3].any?(do |num|
  num.>(4) # `#>`
end)

puts result

=begin

The code will return true. The concept is the `any` method which will return a boolean value based on the return value of the  block. 


The `any` method is invoked on the `[1, 2, 3]` array and passe in a `do/end` block as an argument. If any of the iterations come back true the `any` method evaluates to true.

=end

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end

The return value is `false`. The concept displayed is truthiness where every value in ruby can evaluate to a boolean value.
The only values that evaluate to `false` are `false` and `nil`. The `any` method uses this concept when checking the return value of the
passed in block argument. If the return value of the `do/end` block is truthy the `any` method short-circuits and returns `true` else returns `false`.

The return value is false. 
The concept DEMONSTRATED is truthiness where every value in ruby can evaluate to TRUE OR FALSE. 
The only values that evaluate to false are false and nil. 
The any method ITERATES OVER AND PASSES EACH ELEMENT OF A COLLECTION TO THE GIVEN BLOCK AND RETURNS TRUE IF THE BLOCK EVER RETURNS A VALUE OTHER THAN FALSE OR NIL.