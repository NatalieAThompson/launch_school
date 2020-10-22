# Write a method that counts the number of occurrences of each element in a given array.

# Copy Code
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# Expected output:

# Copy Code
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

def count_occurrences(an_array)
  count = {}

  an_array.each do |element|
    if !count.include?(element)
      count[element] = 1
    else
      count[element] += 1
    end
  end

  count.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

=begin
Input: array
Output: nil (side effect: print string to consol)
-Words are case-sensitive

Data Struct
Array, int, string, Hash?

Algorithm
Create a method `count_occurrence` that takes in `an_array`
  Initalize an empty hash `count`
  loop through `an_array` for each `element`
    if `count` doesn't have a key called `element`
      Initalize the `element` key to 1
    else
      reassign the `element` key plus 1
  
  loop through `count` for each key-element pair
    print the values of key and element

=end