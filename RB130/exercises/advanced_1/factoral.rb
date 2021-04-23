enum = Enumerator.new do |yielder|
  yielder << 1
  yielder << 1
  index = 1
  previous_num = 1
  
  loop do
    index += 1
    yielder << index * counter
    previous_num = index * previous_num
  end
end

p enum.first 10