# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display both the tip and the total amount of the bill.

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

def find_tip(bill, percent)
  bill * (percent * 0.01)
end

def find_total(bill, tip)
  bill + tip
end

p "What is the bill?"
bill = gets.chomp.to_f

p "What is the tip percentage?"
percent = gets.chomp.to_i

tip = find_tip(bill, percent)
total = find_total(bill, tip)

puts sprintf("The tip is %.2f", tip)
puts sprintf("The total is %.2f", total)