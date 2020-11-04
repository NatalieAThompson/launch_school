#Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half 
# and second half of the original Array, respectively. If the original array contains an odd number of elements, 
# the middle element should be placed in the first half Array.

def halvsies(ar)
  ar.length.odd? ? split_index = ar.length / 2 : split_index = (ar.length / 2) - 1

  [ar[0..split_index], ar[split_index+1..-1]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

=begin
input: array
output: nested array
- contains the 1st and second halves of the array split in two
- if the array is 1 element then the 2nd array will be empty
- if the array is empty, both arrays will be empty
- if the array has an odd number, the first array gets the extra element

Algorithm
Define `halvsies` that takes in `ar`
  -Find out the length of ar
    - if the length is odd use the number from length / 2 as the index element of first ele of 2nd array
    - else subtract -1 from that math as the index of the first ele of 2nd ar
  -Initalize a nested array 
    -The first array element will be `ar` index 0 to number above
    -The 2nd array element will be `ar` index number above + 1 to -1
=end