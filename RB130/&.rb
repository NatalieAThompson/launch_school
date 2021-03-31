#converts block to proc
def hey_there(&block) 
  
  block.call
  
end

hey_there { puts "I'm being converted from a block to a proc" }

#---------------------
#converts symbol to proc
array_of_numbers = [1, 2, 3]

ints_to_str = array_of_numbers.map(&:to_s)
              # Proc.new { |n| n.to_s }
p ints_to_str

# The ampersand converts the symbol to a proc.  symbols represent a method name, so it's taking that symbol, finding the corresponding method with the same name, and using that to create the proc.


#-----------------------------
# converts proc to block
array_of_numbers = [2, 4, 5]

hello = Proc.new { |n| n.to_s }

p array_of_numbers.map(&hello)