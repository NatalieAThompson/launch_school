require 'securerandom'

#Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.select do |hsh|
  hsh.all? do |key, value|
    value.all? { |num| num.even? }
  end
end

p arr2

#----------------------------------------------------

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. 
# That is, without any form of synchronization, two or more separate computer systems can create new items 
# and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def uuid()
  hex_char = ('0'..'9').to_a + ('a'..'f').to_a

  string = '00000000-0000-0000-0000-000000000000'

  string.each_char.with_index do |char, index|
    if char == '0'
      string[index] = hex_char.sample
    end
  end
  
  string
end

p uuid
p SecureRandom.uuid
