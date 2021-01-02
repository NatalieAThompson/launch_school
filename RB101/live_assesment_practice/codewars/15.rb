=begin
15. Take a Ten Minute Walk
(https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby)
6 kyu
You live in the city of Cartesia where all roads are laid out in a perfect grid. 
You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. 
The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends 
you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). 
You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, 
so create a function that will return true if the walk the app gives you will take you exactly ten minutes 
(you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). 
It will never give you an empty array (that's not a walk, that's standing still!).
=end

def is_valid_walk(ar)
  return false unless ar.length == 10

  count = ar.tally
  return true if count["n"] == count["s"] && count["e"] == count["w"]
  false
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

=begin
input: array
output: boolean value
- city in a perfect grid
- 10 min too early for an appointment
- Walk generating app
- array of on-letter strings that indicate a direction to walk (n,s, w, e)
- Walk one block that direction
- walking one block takes 1 minute
- returns true if walk is ten minutes
- returns false if walk is anything other than 10 minuate
- array will always be valid
- return you to the starting point or false

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
.
.
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
.
.
.
- If we go n we need to have a matching south and vice versa for e and w.

Algorithm
- Create a method is_valid_walk that takes an ar
  - return false if the array is not 10 elements long
  - count the amount of n, s, w, e in the array
  - return true if n == s and w == e
  - else reutn false
=end
