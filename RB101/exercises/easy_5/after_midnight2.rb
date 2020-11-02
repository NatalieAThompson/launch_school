# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. 
# If the number of minutes is positive, the time is after midnight. 
# If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. 
# Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.
def total_minutes(hours, minutes)
  (hours * 60) + minutes
end

def string_to_int(time)
  time.split(':').map { |str| str.to_i }
end

def after_midnight(time)
  hours, minutes = string_to_int(time)
  total_minutes(hours, minutes) == 1440 ? 0 : total_minutes(hours, minutes)
end

def before_midnight(time)
  hours, minutes = string_to_int(time)
  total_minutes(hours, minutes) == 0 ? 0 : 1440 - total_minutes(hours, minutes)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

=begin
// after_midnight
input: string
output: integer

// before_midnight
input: string
output: integer

Algorithm
-Split the time string into an array seperated by the :
-loop through the array and convert the strings to integers
-Initalize hours to the first array number
-Initalize minutes to the 2nd array number
-multiply the hours by 60 and add them to the minutes
  -in the before_midnight method subtract the new minutes from 1440
-return minutes


=end