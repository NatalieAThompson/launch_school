# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. 
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(str)
  str = str.delete('^()')
  open_para = 0
  close_para = 0

  str.each_char do |char|
    if char == '('
      open_para += 1
    elsif char == ')' && open_para > close_para
      close_para += 1
    else
      return false
    end
  end

  return false unless open_para == close_para
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
# Note that balanced pairs must each start with a (, not a ).

=begin
input: string
output: boolean
-parentheses need to be balanced
  -if there is an open ( then there should be an ending one )

Examples
'((What) (is this))?' => (()()) 
  

Algorithm
Delete anything from the string that isn't a ( or )
create open = 0
create close = 0
loop through what is left
  You can only add to close if open is greater than close
    if not return false

=end