=begin
26. Mean Square Error
(https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby)
Complete the function that

accepts two integer arrays of equal length
compares the value each member in one array to the corresponding member in the other
squares the absolute value difference between those two values
and returns the average of those squared absolute value difference between each member pair.
Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
3, 3, 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
0, 5, 5, 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2
1, 1
=end

def solution(ar1, ar2)
  ar1.map.with_index do |ele, index|
    (ele - ar2[index]).abs ** 2.0
  end.sum / ar2.length
end
p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1

=begin
input: 2 arrays (equal length and of integers)
output: integer
-for each element in the firt array subtract that element in the second array and get the abs number
-Get the number ** 2
- add all the numbers together
- divide by the length of the array

Algorithm
- Create a method solution that takes ar1 and ar2
  - transform ar1 with index |ele, index|
    - subtract ele from ar2[index] and get the absolute version of the number
    - raise that number to the power of 2
  - add all the numbers and divide by ar1.lenght
=end
