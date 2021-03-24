def times(num)
  counter = 0
  
  loop do
    yield(counter)
    counter += 1
    break if counter == num
  end
  
  num
end

p (times(5) do |num|
  puts num
end)

# 0 to 4 output
# return 5