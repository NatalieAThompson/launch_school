# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees 
# and returns a String that represents that angle in degrees, minutes and seconds. 
# You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, 
# and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

def degree_string_ar(degree)
  degree_ar = degree.to_s.split('')
  split_index = degree_ar.find_index('.')

  degree_ar[0] = degree_ar.slice(0..split_index).join
  unless split_index == nil
    degree_ar[1] = '0' + degree_ar.slice(split_index..-1).join
  else
    degree_ar[1] = nil
  end

  degree_ar
end

def dms(degree)
  end_str = ''
  end_str += sprintf("%i\xC2\xB0", degree_string_ar(degree)[0].to_i)
  if degree_string_ar(degree)[1] != nil
    degree = degree_string_ar(degree)[1].to_f * 60
    end_str += sprintf("%02i'", degree_string_ar(degree)[0].to_i)
    if degree_string_ar(degree)[1] != nil
      degree = degree_string_ar(degree)[1].to_f * 60
      end_str += sprintf("%02i\"", degree.to_i.to_s)
    else
      end_str += "00\""
    end
  else
    end_str += "00'00\""
  end
  end_str
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Note: your results may differ slightly depending on how you round values, 
# but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:
# DEGREE = "\xC2\xB0"

=begin
input: float
output: string
-output should be degrees, minutes, seconds
-degree symbol = "\xC2\xB0"
-minute = '
-seconds = "
degree has 60 minutes
minute has 60 seconds
-format answer with 2 digits for min and sec

Examples
-numbers before the . are degrees
-To get minutes use the numbers after the decimal and multiply the number by 60
  -Use the number before the decimal
-To get the seconds user the number remaining from the minutes. Multiply that number by 60
dms(76.73) == %(76°43'48")
decimal = 76
minutes = .73 * 60 (43.8 rounded down) 43
seconds = .8 * 60 = 48

Algorithm
Define a method dms that takes in `degree`
  -Initialize an empty string `end_str`
  -Convert `degree` to a string
    -split the string on any '.' to `degree_ar`
  -put the 0 index of `degree_ar` into end_str with degree symbol added
  -Check 1 index of `degree_ar` if nil
    -put 00'00" onto `end_str`
  -else convert the string back to a number
    -multiply the number by 60
    -Here we are going to want to convert to a string and slit it on the . again
      -put the 0 index of this split on `end_str` with a '
      -Check 1 index of ar if nill
        -put 00" on `end_str`
      -else convert the string back to a number
        -multiply the number by 60
        -Convert to a string and split it on .
          -add that to `end_str` with " on the end
=end