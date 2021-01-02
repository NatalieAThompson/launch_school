=begin
50. Equal Sides Of An Array
(https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby)
Equal sides of an array
6 kyu
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array {1,2,3,4,3,2,1}: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.
You are given the array {1,100,50,-51,1,1}: Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:
You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Note: Please remember that in most programming/scripting languages the index of an array starts at 0.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.

Problem: Given an array of integers, return the index in which the sum of the left side's elements equals the right side.

Rules: The value at the actual index is not counted.

If no index makes left side sum equal right side sum, return -1.

Integer array's length is minimum 1 and maximum 999.
Any of the numbers can be positive or negative.

An array of 0's will return 0. make a guard clause

Data structure: array of integers input--- output is an integer

Algorithm:

An array of 0's will return 0. make a guard clause

Initialize index = 0

initialize variable `left_side_sum` to the summation of array_of_integers' elements from 0 index to the given `index`, exclusive of the `index`

Initialize variable `right_side_sum` to the summation of array_of_integers' elements from `index` + 1 to the last element

Loop through array of integers, with an index
  Compare sum of integers to the left of the index, non inclusive
    To the sum of the integers to the right of the index, non inclusive
    If the sums are equal, return the index
    if the sums are never equal, finish iterating
    
return -1

=end

# def find_even_index(array_of_integers)
#   return 0 if array_of_integers.all? { |num| num == 0}
#   index = 0
  
#   # left_side_sum = array_of_integers[0...index].sum
#   # right_side_sum = array_of_integers[index + 1..-1].sum

#   loop do
#     if array_of_integers[0...index].sum == array_of_integers[index + 1..-1].sum
#       return index
#     else
#       index += 1
#       break if index == array_of_integers.size
#     end
#   end
  
#   -1
# end

def find_even_index(array_of_integers)
  return 0 if array_of_integers.all? { |num| num == 0}
  index = 0
  
  left_side_sum = array_of_integers[0...index].sum
  right_side_sum = array_of_integers[index + 1..-1].sum
  
  loop do
    if left_side_sum == right_side_sum
      return index
    else
      index += 1
      break if index == array_of_integers.size
    end
    
    left_side_sum = array_of_integers[0...index].sum
    right_side_sum = array_of_integers[index + 1..-1].sum
  end
  
  -1
end

def find_even_index(ar)
  ar.each.with_index do |num, index|
    left = ar[0...index].sum
    right = ar[(index + 1)..-1].sum
    
    if left == right
      return index
    end
  end
  
  -1
end

def find_even_index(arr)
  arr.each_with_index do |num, index|
    return index if arr[0...index].sum == arr[index + 1..arr.length - 1].sum
  end
  -1
end

def find_even_index(arr)
  right_side_sum = arr.sum
  idx = 0
  loop do 
    right_side_sum -= arr[idx]
    left_side_sum = arr.sum - right_side_sum - arr[idx]
    return idx if right_side_sum == left_side_sum
    idx += 1 
    break if idx > arr.length - 1
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1