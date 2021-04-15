def drop_while(ar)
  switch = false
  
  ar.each_with_object([]) do |ele, result|
    next if yield(ele) && !switch
    switch = true
    switch ? result << ele : result
  end
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
# This line in the examples is not a typo:

# Copy Code
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]