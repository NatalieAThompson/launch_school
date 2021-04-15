def step(start, ending, step)
  counter = 0
  
  start.upto(ending) do |ele|
    if counter == 0
      yield(ele)
      counter = step
    end
    counter -= 1
  end
  
end

p step(1, 10, 3) { |value| puts "value = #{value}" }