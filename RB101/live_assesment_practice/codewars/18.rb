=begin
18. Persistent Bugger.
(https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby)
6 kyu
Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, 
which is the number of times you must multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number
=end

def persistence(num)
  count = 0

  until num < 10
    num = num.digits.reduce(:*)
    count += 1
  end
  
  count
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4

=begin
input: integer (positive)
output: integer
- multiplicative persistence: number of times you multipy the digits in num until you reach a single digit

p persistence(39) == 3
3*9 = 27
2*7 = 14
1*4 = 4
p persistence(4) == 0
p persistence(25) == 2
2*5 = 10
1*0 = 0
p persistence(999) == 4

Algorithm
- Create a method persistence that takes in num
  - Initalize a variable count = 0
  - loop until num < 10
    - break num into a digit array 
      - multiply the numbers and reassign num to that
      - increase count by 1
  - return count
=end
