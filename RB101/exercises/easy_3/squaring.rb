# Using the multiply method from the "Multiplying Two Numbers" problem, 
# write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def square(num, power)
  product = 1

  power.times do |_| 
    product = multiply(product, num)
  end

  product
end

def multiply(num, num2)
  num * num2
end

p square(5, 2) == 25
p square(-8, 2) == 64