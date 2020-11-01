# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century number, 
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. 
# So, the years 1901-2000 comprise the 20th century.

def century(year)
  century = year / 100

  unless year % 100 == 0
    century += 1
  end

  digits = century.digits.reverse
  if digits[-2] == 1
    sprintf('%ith', century)
  elsif digits[-1] == 1
    sprintf('%ist', century)
  elsif digits[-1] == 2
    sprintf('%ind', century)
  elsif digits[-1] == 3
    sprintf('%ird', century)
  else
    sprintf('%ith', century)
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

=begin
input: integer
output: string
-return the centery that relates to the given year
  centurys start on 01 years
    1 - 100 = 1st
    101 - 200 = 2nd
    201 - 300 = 3rd
    301 - 400 = 4th
    ...
    2001 - 2100 = 21st
When is st, nd, rd, th used?
  -If number ends in 1 but isn't a teen then use st
  -If number ends in 2 but isn't a teen then use nd
  -If number ends in 3 but isn't a teen then use rd
  -If number ends in anything else use th
  
examples
2000 / 100 = 20
2001 / 100 = 20.01 (21st)
1965 / 100 = 19.65 (20th)
256 / 100 = 2.65 (3rd)

Data Structures
Ints, strings, Array?

Algorithm
-Define a method `century` that takes in `year`
  -Initalize local variable `century`
    -Divide year by 100
  -Check the remainder of the division
    if there is a remainder round `century` up
    else keep the same
  -initalize `digits` to the seperation of `century` into an array of digits
    -check the 2nd to last digit if it is a 1
      -return the `century` with th at the end
    -check the last digit 
      -if it is a 1
        -return the `century` with st at the end
      -if it is 2
        -return the `century` with nd at the end
      -if it is 3
        -return the `century` with rd at the end
      else
        -return `century` with th at the end
    
  


=end