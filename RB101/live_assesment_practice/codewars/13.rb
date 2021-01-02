# 13. Kebabize
# (https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby)
# 6 kyu
# Modify the kebabize function so that it converts a camel case string into a kebab case.

# kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# kebabize('camelsHave3Humps') // camels-have-humps
# Notes:

# the returned string should only contain lowercase letters
# =end

def kebabize(str)
  result = ''

  str.each_char do |char|
    if char =~ /[a-z]/
      result << char
    elsif char =~ /[A-Z]/
      result << '-' + char.downcase
    end
  end

  result
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

=begin
input:string
output: string
- lowercase the uppercasee letter and add a - infront of it
=end