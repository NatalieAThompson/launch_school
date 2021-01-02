=begin
21. Find the Mine!
(https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby)
6 kyu
You've just discovered a square (NxN) field and you notice a warning sign. 
The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. 
The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, 
and the second element is the column index of the bomb location (both should be 0 based). 
All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.
=end

def mineLocation(mine_field)
  mine_field.each.with_index do |sub_ar, index|
    sub_ar.each.with_index do |ele, index2|
      return [index, index2] if ele == 1
    end
  end
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]

=begin
input: nested array
output: array
- Find the location of the 1 in the nested array

Algorithm
- Create a method mineLocation that takes in mine_field
  - loop through mine_field with index
    - loop through the sub_array with index2
      - if a 1 is found return [index, index2]
=end
