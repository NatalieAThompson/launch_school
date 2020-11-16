# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains 
# all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the 
# result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

def merge(ar1, ar2)
  if ar1.length > ar2.length 
    long = ar1
    short = ar2
  else
    long = ar2
    short = ar1
  end

  return long if short.length == 0

  new_ar = []
  long = long.uniq
  short = short.uniq
 
  (short.length).times do |n|
    if short[n] < long[n]
      new_ar << short[n]
      new_ar << long[n]
    else
      new_ar << long[n]
      new_ar << short[n]
    end
  end 

  unless long.length == short.length
    new_ar << long[short.length..-1]
  end

  new_ar = new_ar.flatten

  counter = 0
  until new_ar.length == (ar1 + ar2).length
    ar1_count = ar1.count(long[counter])
    ar2_count = ar2.count(short[counter])
    if ar1_count > 1
      (ar1_count-1).times { |_| new_ar.insert(ar1[counter], ar1[counter]) }
    end
    if ar2_count > 1
      (ar2_count-1).times { |_| new_ar.insert(ar2[counter], ar2[counter]) }
    end
    counter += 1
  end

  new_ar
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

=begin
input: 2 arrays
output: array
-The output array can have duplicates
-arrays are not the same length

Algorithm
Check that array lengths are above 0.
  if one of the length is 0 return the other one
Create new_ar = []
loop through the shorter array with index
  loop through the longer array with index
    compaire each element with shorter array element
      if the element is smaller than the shorter array add it to new_ar
      if the element is == to shorter array add it to new_ar
      if the element is greater than the shorter array add the shorter array element to new_ar
        break
return new_ar
    
=end