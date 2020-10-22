# def select_fruit(hash)
#   new_hash = { }

#   hash.each do |key, value|
#     if value == 'Fruit'
#       new_hash[key] = value
#     end
#   end

#   new_hash
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers!(numbers)
#   numbers.map! { |num| num * 2 }
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers!(my_numbers)

# p my_numbers

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers)

# def multiply(ar, num)
#   ar.map { |val| val * num }
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3)

def select_letter(question, letter)
  str = ''

  question.each_char do |cha|
    if cha == letter
      str << cha
    end
  end

  str
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z')