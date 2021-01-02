=begin

Given an array (arr) of integers, and a positive integer k. Find the number of pairs (i, j) having the sum (arr[i] + arr[j]) that is divisible by k and i < j. 

Test cases:

divisible_sum_pairs([1, 3, 2, 6, 1, 2], 3) == 5
(1, 2), (1, 2), (1, 2), (3, 6), (1, 2)

divisible_sum_pairs([8, 10], 2) == 1
(8, 10)
divisible_sum_pairs([5, 9, 10, 7, 4], 2) == 4
(5, 9), (5, 7), (7, 9), (4, 10)
divisble_sum_pairs([29, 97, 52, 86, 27, 89, 77, 19, 99, 96], 3) == 15

=end

def divisible_sum_pairs(ar, total)
  pairs = []
  
  ar.each.with_index do |ele, index|
    counter = 1
    (ar.length-(index+1)).times do
      if (ele + ar[index + counter]) % total == 0
        pairs << [ele, ar[index + counter]]
      end
      counter += 1
    end
  end
  
  # pairs.map do |sub_ar|
  #   if sub_ar[0] > sub_ar[1]
  #     [sub_ar[1], sub_ar[0]]
  #   else
  #     sub_ar
  #   end
  # end
  
  pairs.length
end

p divisible_sum_pairs([1, 3, 2, 6, 1, 2], 3) == 5
# (1,3), (1,2)...
# (3, 2), (3,6)...
p divisible_sum_pairs([8, 10], 2) == 1
p divisible_sum_pairs([5, 9, 10, 7, 4], 2) == 4
p divisible_sum_pairs([29, 97, 52, 86, 27, 89, 77, 19, 99, 96], 3) == 15

=begin
input:array (of integers), integer (positive)
output: integer
- The output should represent the amount of pairs in the array input
- i needs to be less than j (2nd number in the pair)
- pairs sum has to be divisible by k


Questions
-Can pairs be in any order from the array? yes

Data Structure
Arrays, integers, iteration

Algorithm
-Create a method `divisible_sum_pairs` that takes `ar` and `total`
  -  `pairs` equal to an empty array
  - iterate for every element in the `ar` array
    -counter should equal 1
    - loop for a the remaining numbers in the `ar`
      - sum the current outer loop element to the inner loop element 
        -if it divides evenly by the `total` then save it in `pairs`
  - loop through pairs
    - make sure the larger number comes second
  - return pairs


=end

# array1 = ['a', 'b', 'c', 'd']

# #array2 = ['e', 'f', 'g', 'h']

# result = []

#  array1.each.with_index do |letter, index|
#   array1.each.with_index do |letter2, index2|
#     if index != index2 
#       result << [letter, letter2]
#     end
#   end
# end

# p result

# p array1.permutation(2).to_a