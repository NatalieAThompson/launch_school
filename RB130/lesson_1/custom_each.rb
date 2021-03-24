
def each(array)
  counter = 0
  
  while counter < array.size
    yield(array[counter])
    counter += 1
  end
  
  array
end

p (each([1, 2, 3]) do |num|
  puts num
end)