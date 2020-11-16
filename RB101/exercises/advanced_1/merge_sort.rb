def create_sub_ar(ar)
  mid = ar.length / 2
  [ar[0...mid], ar[mid..-1]]
end

def each_num_in_array(ar)
  count = ar.length - 1
  p count
  ar = create_sub_ar(ar) 
  p ar.length

  until ar.length == 4
    ar = ar.map do |sub_ar|
      create_sub_ar(sub_ar)
    end
    p ar
  end

=begin
  [7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
  [[7, 3, 9, 15, 23, 1, 6, 51], [22, 37, 54, 43, 5, 25, 35, 18, 46]]
=end

  p ar
end

def merge_sort(ar)
  p ar = each_num_in_array(ar)
  p array_depth = ar.length - 1
  #p find_deepest_pair(ar)
  # new_ar = ar.map.with_index do |sub_ar, index|
  #   pair = find_deepest_pair(sub_ar)
  #   merge(pair[0], pair[1])
  # end
  
end

def find_deepest_pair(ele)
  unless ele.length == 2 && ele[0].length == 1
    find_deepest_pair(ele[0])
  else
    return ele
  end
end

# def deep_ele_not_ar(ele)
#   if ele.is_a? Array
#     deep_ele_not_ar(ele)
#   else
#     return true
#   end
# end

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

#p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

=begin
input: array
output: array
-use merge sort

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]



Algorithm
Break the array in 
=end