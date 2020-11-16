def rotate90(matrix)
  count = matrix[0].length
  new_ar = []
  count.times { |_| new_ar << [] }

  matrix.each do |sub_ar|
    sub_ar.each.with_index do |num, index|
      new_ar[index].unshift(num)
    end
  end

  new_ar
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

=begin
input: nested array
output: nested array
-return a new nested array

Algorithm
Count the length of one of the sub_arrays
create a new_ar = [] plus add sub_arrays based on the count
loop through matrix
  loop through |sub_ar| with index
    -add the element to the beginning of the new_ar[index] array
return new_ar
=end