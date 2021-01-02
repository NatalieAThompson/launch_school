def revrot(str, sz)
  return "" if str.empty? || sz > str.length || sz == 0
  
  sections = str.length / sz
  index = 0
  parts = []
  
  sections.times do
    parts << str[index, sz]
    index += sz
  end
  
  parts.map! do |nums|
    total = nums.to_i.digits.reverse.map { |num| num**2 }.sum
    
    total % 2 == 0 ? nums.reverse : rotate(nums.chars)
  end
  
  parts.join
end

def rotate(nums)
  temp = nums.shift
  nums << temp
  nums.join
end

=begin
input: string, integer
output: string
- cut the string into chunks based on the integer
- find the sum of the cubed digits in the chunk
  - Then see if it is divisible by 2 
    - if so reverse the digit order
    - if not rotate the chunk to the left by one position
- put together all the chucks and return them as a string

- if string is empty return it
- if sz is larger than str.length return and empty string.

examples
revrot("123456987654", 6) --> "234561876549"
1, 2, 3, 4, 5, 6 
  -(1**2 + 2**2 + 3**2 + 4**2 + 5**2 + 6**2) = 91
  -Not divisible by 2 => 2, 3, 4, 5, 6, 1
9, 8, 7, 6, 5, 4
  -(9**2 + 8**2 + 7**2 + 6**2 + 5**2 + 4**2) = 271
  -Not divisible by 2 => 8, 7, 6, 5, 4, 9
  
Algorithm
  - add gaurd breaks
    - return an "" if str is empty or sz is greater than str.length
  - find the number of string sections 
    - find the length of the string and divide it by the integer
  - create a `index` counter equal to 0
  - create an empty array `parts`
  - loop the number for the number of `sections`
    - add the sections to the array by starting at index up to integer length
    - increment index by the integer
  - iterate through `parts` with |nums|
    - break into an array of digits
      -iterate through the digits and the the result of the power of 2
      -sum the result
      -if the result can be evenly divided by 2
       - reverse `nums`
      - else
        - rotate `nums`
          -remove the first index of the array
          -add that index to the end of the new array
          -return that as a joined string

=end