def each_with_index(ar)
  counter = 0
  
  ar.each do |ele|
    yield(ele, counter)
    counter += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# should output:

# Copy Code
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true
