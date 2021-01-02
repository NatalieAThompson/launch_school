=begin
17. Write Number in Expanded Form
(https://www.codewars.com/kata/5842df8ccbd22792a4000245)
6 kyu
Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

If you liked this kata, check out part 2!!
=end
def expanded_form(num)
  ar_of_digits = num.digits

  ar_of_digits.map!.with_index do |ele, index|
    format("%i%s", ele, "0" * index)
  end

  ar_of_digits.select do |ele|
    ele =~ /[1-9]/
  end.reverse.join(" + ")

end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

=begin
input: integer
output: string

Algorithm
- Create a method expanded_form that takes in num
  - Create an array of digits
  - loop through the digits array and add a 0 for every index number
  - select only the elements that aren't 0
  - join the array with a +
=end
