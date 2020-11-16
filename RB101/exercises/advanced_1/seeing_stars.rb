# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. 
# The smallest such star you need to handle is a 7x7 grid.

def mark?(num, num2, middle, ar)
  num2 == num || num2 == ar[-num] || num2 == ar[middle-1] || num == middle
end

def star(n)
  middle = (n / 2) + 1
  ar = *(1..n)

  ar.each do |num|
    ar.each do |num2|
      mark?(num, num2, middle, ar) ? print('*') : print(' ')
    end
    puts
  end
end

=begin
input: integer
output: string 
return: nil
-n will always be odd
-n width
-n height
-The middle row is always all *
-On the first column want the 1s, middle, last printed
-2nd: 2nd, middle, last
-3rd: 3rd, middle, last
-middle: all marked
-repeat
-Rows
  -1: 1st, middle, last
  -2: 2nd, middle, 2nd from last
  -3: 3rd, middle, 3rd from last
  -middle: all of them
  -repeat

We know the column is going to be n length
We know that we need to count up when counter is under half of n length
We know that we need to count down when counter is about half of n length

Algorithm
find the middle by 7/2 + 1
loop from 1 to n
  print * in the location of the loop
  print * in the middle 
  print * in the location of the -loop
  
  inner loop from 1 to n
    print * in the location of the loop
    print * in the middle 
    print * in the location of the -loop


=end

star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *