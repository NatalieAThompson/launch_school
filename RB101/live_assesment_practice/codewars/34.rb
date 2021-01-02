#https://www.codewars.com/kata/53b5e7d59c1553a0b40007f3
=begin
Sherlock has to find the suspect on his latest case. He will use your method, dear Watson.
The suspect in this case is a number which is most unique in given set, e.g.:
- has least (minimum) occurences in set
- and no other number has the same occurences count
Write a method which helps Sherlock to find the suspect from given set of numbers.
If no suspect is found the method should return nil.
=end
# def find_suspect(array)
#   groups_hsh = array.group_by { |number| array.count(number) }
#   p groups_hsh
#   min = groups_hsh.keys.min
#   p min
#   groups_hsh[min].uniq.length == 1 ? groups_hsh[min][0] : nil
# end
def find_suspect(num_ar)
  count = num_ar.tally
  sorted_ar = count.sort_by { |key, value| value }
  count.select! do |key, value|
    sorted_ar[0][1] == value
  end
  if count.length == 1
    count.keys[0]
  else
    nil
  end
end
# def find_suspect(arr)
#   uniq_nums = arr.sort_by { |num| arr.count(num) }.uniq
#   hsh = {}
#   uniq_nums.each do |num|
#     hsh[num] = arr.count(num)
#   end
#   min_occurances = hsh.values.max + 1
#   result = nil
#   hsh.each do |key, value|
#     if value < min_occurances
#       min_occurances = value
#       result = key
#     elsif value == min_occurances
#       return nil
#     end
#   end
#   result
# end
p find_suspect([1, 2, 3, 4, 2, 2, 1, 4, 4]) == 3
p find_suspect([1, 1, 2, 2]) == nil
p find_suspect([1, 1, 2, 2, 2]) == 1
p find_suspect([1, 2, 3, 4, 4, 3]) == nil
=begin
input: array of integers
output: nil or integer
- looking for a number that occurs the least, and doesn't have the same count as another number
- If no suspect is found then return nil.
  - There is no suspect if two people are equally suspi
p find_suspect([1, 2, 3, 4, 2, 2, 1, 4, 4]) == 3
1 => 2
2 => 3
3 => 1
4 => 3
p find_suspect([1, 1, 2, 2]) == nil
1 => 2
2 => 2
Since they both have the same count return nil
p find_suspect([1, 1, 2, 2, 2]) == 1
p find_suspect([1, 2, 3, 4, 4, 3]) == nil
1 => 1
2 => 1
Algorithm
-Create a method find_suspect that takes array `num_ar`
  - Create a hash based on the count of the digits in num_ar (count)
  - Sort the hash by the values
  - Select the key value pairs that have a value equal to the first value in the sorted hash
  - If there is one element selected return the key
  - if there is more than one element selected then return nil
=end