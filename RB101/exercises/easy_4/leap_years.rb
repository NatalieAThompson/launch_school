# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, 
# unless the year is also divisible by 100. If the year is evenly divisible by 100, 
#   then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. 
# Write a method that takes any year greater than 0 as input, 
# and returns true if the year is a leap year, or false if it is not a leap year.

def leap_year?(year)
  year <= 1752 ? year % 4 == 0 : year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

=begin
input: integer
output: bool
- evenly divisible by 4 (true)
  - unless divisible by 100 (false)
    - unless divisible by 400 (true)

Algorithm
-Check if the year is divisible by 400
  -if true return true
-Check that the year is divisible by 4 but not 100
  -if true return true
  -else return false
=end

# A continuation of the previous exercise.

# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. 
# Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, 
# leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

=begin
input: integer
output: boolean
- 1752 leap year
- Before 1752 any year evenly divisible by 4 is a leap year

Algorithm
-Check if the year is equal to or less than 1752
  -if the year is and divisable by 4
    -return true
=end