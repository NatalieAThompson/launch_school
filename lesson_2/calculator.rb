puts "Welcome to Calculator!"

puts "Pick a number"
num = gets.chomp

puts "Pick another number"
num2 = gets.chomp

puts "What operation would you like to perform? 1) addition 2) subtraction 3) multiplication 4) division"
operation = gets.chomp

case operation
  when "1"
    result = num.to_i + num2.to_i
  when "2"
    result = num.to_i - num2.to_i
  when "3"
    result = num.to_i * num2.to_i
  when "4"
    result = num.to_f / num2.to_f
end

p result


