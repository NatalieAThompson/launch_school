# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. 
# For example, the transposition of the array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6
# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. 
# Note that there is a Array#transpose method that does this -- you may not use it for this exercise. 
# You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

def transpose(matrix)
  empty_ar = []
  amount = 0
  matrix.each {|sub_ar| amount = sub_ar.length if sub_ar.length > amount}
  amount.times do
    empty_ar << []
  end

  matrix.each do |sub_ar|
    sub_ar.each.with_index do |ele, index|
      empty_ar[index] << ele
    end
  end

  empty_ar
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# This program should print "true" twice.

=begin
input: nested array
output: new nested array
-swap the rows and columns
-will always be 3 by 3

Algorithm
Create a new empty nested array [[], [], []]
loop through matrix
  loop through elements of matrix
    -if the element is in index 0 then add it to new_array[0]
    -do that for the other indexs
return new_array
=end

# In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

# Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

# Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
