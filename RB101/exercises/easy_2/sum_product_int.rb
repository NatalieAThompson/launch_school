# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def s_or_p_valid()
  loop do
    letter = gets.chomp.downcase

    if letter == 's' || letter == 'p'
      return letter
    else 
      puts "Please type s or p"
    end
  end
end

def sum(int)
  (1..int).reduce(&:+)
end

def product(int)
  (1..int).reduce(&:*)
end

puts ">> Please enter an integer greater than 0:"
int = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product"
s_or_p = s_or_p_valid

sum = sum(int)
product = product(int)

if s_or_p == 's'
  puts sprintf("The sum of the integers between 1 and %i is %i", int, sum)
else 
  puts sprintf("The sum of the integers between 1 and %i is %i", int, product)
end