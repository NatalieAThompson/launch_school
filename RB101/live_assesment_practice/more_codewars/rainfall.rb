def mean(town, strng)
  selection = matching_line(town, strng)
  return -1 if selection.empty?
  
  digits = grab_digits(selection)
  digits.sum / digits.length
end

def variance(town, strng)
  selection = matching_line(town, strng)
  return -1 if selection.empty?
  
  digits = grab_digits(selection)
  mean = mean(town, strng)
  
  digits.map { |flo| (flo - mean)**2 }.sum / digits.length
end

def matching_line(town, strng)
  strng.each_line.select do |n|
    n.match?(/#{town}:.*/)
  end
end

def grab_digits(str)
  str.join.scan(/\d+\.\d+/).map { |str| str.to_f }
end

=begin
mean
input: 2 strings
output: float
- average rainfall

variance
input: 2 strings
output: float
- variance of rainfall

- return -1 if town has no records

Algorithm
  - break strng into an array
    - return the line that matches the town
  - collect only the numbers from strng
For Mean
  - get the length of the array
  - add all the numbers and dived by the length
For Variance
  - iterate through each number
  - subtract the mean
  - power of 2
  - Then get the average of those numbers

=end