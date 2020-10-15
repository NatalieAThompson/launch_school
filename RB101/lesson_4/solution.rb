def sum_even_number_row(row_number)
  rows = []
  start_integer = 2

  (1..row_number).each do |current_row_num|
    rows << create_row(start_integer, current_row_num)
    start_integer = rows[current_row_num - 1][-1] + 2
  end

  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer

  until row.length >= row_length
    row << current_integer
    current_integer += 2
  end

  row
end

p sum_even_number_row(1) == 2   #true
p sum_even_number_row(2) == 10  
p sum_even_number_row(4) == 68

# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]