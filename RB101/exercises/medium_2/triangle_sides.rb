# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, 
# and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol 
# :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

def is_valid?(ar)
  ar = ar.sort
  return false unless ar[0..1].sum > ar[2] && ar.all? { |num| num > 0 }
  true
end

def triangle(side1, side2, side3)
  ar = [side1, side2, side3]
  return :invalid unless is_valid?(ar)

  return :equilateral if ar.uniq.length == 1
  return :scalene if ar.uniq.length == 3
  return :isosceles
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

=begin
input: 3 numerics
output: symbol
-if all sides are equal return :equilateral
-if one side is different return :isosceles
-if all sides are different return :scalene
-Check if valid
  -add the two short sides & make sure it is longer than the longest side
  -Make sure all the lengths are greater than 0
  -if invalid return :invalid

Algorithm
Check if valid - if not return :invalid
Check if all equal - if true return :equilateral
Check if one side is diff - if true return :isosceles
return :scalene
=end