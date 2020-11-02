# The time of day can be represented as the number of minutes before or after midnight. 
# If the number of minutes is positive, the time is after midnight. 
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). 
# Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

def time_of_day(time_passed)
  hours = (time_passed / 60) % 24
  minutes = time_passed % 60

  sprintf('%02i:%02i', hours, minutes)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin
input: integer
output: string
-positive: after midnight
-negative: before midnight

examples
24:00 (24:00 - 3) 23:57
hours = 24 + (-3 / 60) = 23
minutes = 0 + (-3 % 60 ) = 57
35 (00:00 + 35) 00:35
hours = 0 + (35 / 60) = 0
minutes = 0 + (35 % 60 ) = 35
-1437 (24:00) 1437/60 (- 23 hours, 57 min )
hours = 24 + (-1437 / 60 ) = 0
minutes = 0 + (-1437 % 60) = 3

Algorithm
Create a method `time_of_day` that takes in a number `time_passed`
  initalize `hours` to (time_passed / 60) % 24
  initalize `minutes` to (time_passed % 60)
  format the hours and minutes into a military time format.

=end