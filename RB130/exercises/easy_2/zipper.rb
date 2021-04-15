def zip(ar1, ar2)
  result = []
  
  ar1.each_with_index do |ele, index|
    result << [ele, ar2[index]]
  end
  
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
