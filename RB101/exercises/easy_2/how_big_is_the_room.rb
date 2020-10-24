# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

def area(length, width)
  length * width
end

def area_in_feet(area_meters)
  (area_meters * 10.7639).round(2)
end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_meters = area(length, width)
area_feet = area_in_feet(area_meters)

puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet)."