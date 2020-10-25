# Write a program that prompts the user for two positive integers, 
# and then prints the results of the following operations on those two numbers: 
# addition, subtraction, product, quotient, remainder, and power. 
# Do not worry about validating the input.

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

puts "==> Enter the first number"
num1 = gets.chomp.to_i

puts "==> Enter the second number"
num2 = gets.chomp.to_i

puts sprintf("%d + %d = %d", num1, num2, num1 + num2)
puts sprintf("%d - %d = %d", num1, num2, num1 - num2)
puts sprintf("%d * %d = %d", num1, num2, num1 * num2)
puts sprintf("%d / %d = %d", num1, num2, num1 / num2)
puts sprintf("%d %% %d = %d", num1, num2, num1 % num2)
puts sprintf("%d ** %d = %d", num1, num2, num1 ** num2)

