# Write a method that will take a short line of text, and print it within a box.

def print_in_box(str)
  width = str.length + 2
  upper_banner = '+' + '-'.center(width, '-') + '+'
  empty_banner = '|' + ' '.center(width) + '|'
  str_banner = '|' + str.center(width) + '|'

  puts upper_banner
  puts empty_banner
  puts str_banner
  puts empty_banner
  puts upper_banner
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# Copy Code
print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.

=begin
input: string
output: nil
- If the input string is empty the box is only 4 spaces in length
- The length of the banner is always 2 characters longer (4character if including |s) than the string passed in

Algorithm
print to the console the upper part of the banner 
  The upper part of the banner would be equal to +, `str` length + 2 of '-', +
print an empty banner row
  |, `str` length + 2 of ' ', |
print the string row
  |, ' ', `str`, ' ', |
print another empty banner row
print lower part of banner
=end